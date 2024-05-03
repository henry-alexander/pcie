#include <linux/module.h>
#include <linux/init.h>
#include <linux/pci.h>
#include <linux/delay.h>

#define AXE5EAGLE_VENDOR_ID 0x1172
#define AXE5EAGLE_DEVICE_ID 0x0000
#define AXE5EAGLE_OFFSET_MEMORY 0x0
#define AXE5EAGLE_OFFSET_LED_STATE 0x2000

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Henry Alexander");
MODULE_DESCRIPTION("A Simple PCIE Driver for the Arrow Agilex 5 Eagle Board");

static struct pci_device_id axe5eagle_ids[] = {
    { PCI_DEVICE(AXE5EAGLE_VENDOR_ID, AXE5EAGLE_DEVICE_ID) },
    { }
};
MODULE_DEVICE_TABLE(pci, axe5eagle_ids);

/*
    @brief   Function is called when PCIE device is registered

    @param   dev pointer to pci device
    @param   id pointer to the corresponding id tables entry
    
    @return  0 on sucess
*/
static int axe5eagle_probe(struct pci_dev *dev, const struct pci_device_id *id)
{

    
    // Enable the device
    if (pci_enable_device(dev)) {
        printk("axe5eagle - Unable to enable PCI device\n"); 
        return -ENODEV;
    }

    if (pci_request_region(dev, 0, KBUILD_MODNAME)) {
        printk("axe5eagle - Unable to request PCI resources\n");
        return -ENODEV;
    }

    void __iomem *bar0_addr = pci_iomap(dev, 0, 0);
    if (!bar0_addr) {
        printk("axe5eagle - Unable to map BAR0\n");
        pci_disable_device(dev);
        return -ENOMEM;
    }

    uint16_t vendor_id, device_id;
    pci_read_config_word(dev, PCI_VENDOR_ID, &vendor_id);
    pci_read_config_word(dev, PCI_DEVICE_ID, &device_id);
    printk("axe5eagle: Vendor ID = 0x%X, Device ID = 0x%X\n", vendor_id, device_id);
    printk("axe5eagle - bar0 address: %p", (void *)bar0_addr);
    printk("axe5eagle - bar0 start: %llx", pci_resource_start(dev, 0));

 
    // Example data to send over PCI 
    
    // OPTION1
    // uint32_t data[] = {0xAAAAAAAA};

    for (uint32_t i = 0; i < 2048; i++){
        uint32_t reg;
        iowrite32(i, bar0_addr+i*4);
        reg = ioread32(bar0_addr+i*4);
        printk("axe5eagle - address: %x writing: %x reading: %x", i*4, i, reg);
        if (reg != i)
        {            
            return 0;
        }
    }

    // Option 2
    // uint32_t data[] = {0xDEADBEEF};    
    // iowrite32(data[0], bar0_addr);
    // printk("axe5eagle - 32-bit write to BAR0 complete\n");

    uint32_t value = ioread32(bar0_addr);
    printk("axe5eagle - bar0 read: %x", value);

    // for (uint32_t i = 0; i < 8 ;i++){
    //     uint32_t reg;
    //     reg = ioread32(bar0_addr+AXE5EAGLE_OFFSET_LED_STATE+i*4);
    //     printk("axe5eagle - Reg: %x Data: %x", AXE5EAGLE_OFFSET_LED_STATE+i*4, reg);        
    // }

    // iowrite32(0x00000000, bar0_addr+AXE5EAGLE_OFFSET_LED_STATE);
    // for (uint32_t i = 0; i < 8 ;i++){
    //     iowrite32(i, bar0_addr+AXE5EAGLE_OFFSET_LED_STATE);
    //     msleep(500);
    // }
    // iowrite32(0x00000000, bar0_addr+AXE5EAGLE_OFFSET_LED_STATE);
    
    return 0;
};

/*
    @brief   Function is called when PCIE device is unregistered
    
    @param   dev pointer to pci device
*/
static void axe5eagle_remove(struct pci_dev *dev)
{
    // pcim_iounmap_regions(dev, BIT(0));

    void __iomem *bar0_addr = pci_iomap(dev, 0, 0);
    if (bar0_addr){
        printk("axe5eagle - running pci_iounmap");
        pci_iounmap(dev, bar0_addr);
    }
    pci_disable_device(dev);
    pci_release_region(dev, 0);
    printk("axe5eagle - Removed device and released resources\n");
};

/* PCI Driver structure*/
static struct pci_driver axe5eagle_driver = {
    .name = "axe5eagle",
    .id_table = axe5eagle_ids,
    .probe = axe5eagle_probe,
    .remove = axe5eagle_remove,
};

/**
 * @brief This function is called, when the module is loaded into the kernel
 */
static int __init my_init(void) {
    int ret;
    printk("axe5eagle - Registering device!\n");
    ret = pci_register_driver(&axe5eagle_driver);
    if (ret)
        printk(KERN_ERR "axe5eagle - Failed to register PCI driver: %d\n", ret);
    return ret;
}

/**
 * @brief This function is called, when the module is removed from the kernel
 */
static void __exit my_exit(void) {
    printk("axe5eagle - unregistering device!\n");
    pci_unregister_driver(&axe5eagle_driver);
}

module_init (my_init);
module_exit (my_exit)

