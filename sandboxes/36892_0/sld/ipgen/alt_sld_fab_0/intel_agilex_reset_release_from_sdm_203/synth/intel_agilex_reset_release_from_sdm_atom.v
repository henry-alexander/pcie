// (C) 2001-2024 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


module  intel_agilex_reset_release_from_sdm_atom 
(
    output wire conf_reset
);
    fourteennm_sdm_gpio_out 
    #(
        .bitpos       (15),
        .role         ("USER_RESET")
    ) 
    sdm_gpo_out_user_reset 
    (
        .gpio_o        (conf_reset)
    );
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "mJX2d9LQW98bAOs4n1BGd5jpMjk3bFLfJWTJpbRRxW5D/L5OCF1Nmi32uHpHBJeeK1ptFRmaGRB1AaxVDzKg7IKMQgp0PjNU6F19OKZUKbcsOyqf+LmPKOFiCdjkSxkU2agV5Vc720Tfd+/FzmzBF+sF5rvOkeaC6tpShg/8nUvCao9t6VjXUSWA8DbJ+FalKPgbXckWzQd1ByfKE8d3oc5YENBRVG6xWHfaHBpWQnKAxbFC+3O/v7ei7nbcQpebaJJCsRW6gpx4dGQWnasaFSmgNKcbklkQpw6p+9ACaax/BLz2Q2yuPvrdW68/RE8BFeKoig86P4Svu5TTLWuoe5QPvyp1tgaxouTOk4+KWHXTPxpvimE0FsP/XBZ0GqbnoZ79m8Htts3U2QGXJBowgGgTrrNI+f7tyyHA84gHYnP9FRzic+yGVPjfxVH2QqLQVeaaF1VfcIujBqu/PIYWyf4SZ2/I3zDqWgAazAZJkNiSqN60Q6jYYKHG3sFi2uzB7tLMm4+pyCuKXdErzNt5bPrUoIXaLCBTQ0J7SKUc8TYgwFaBkyfQJOXPIckkuZtFhjvBieaV9IUfBKUfJg0QNUWTSIu3uqHQ4pgiUATsk355xR03uL8RumWiIx9kgs7WNh6AHVfYBveq03YtuyEkpjdWyup7au3n1oYR4xm99DWygRrVbjJD94RU+xJLTzp+KWG4lHUo6VTyW2lt82ZGDyIjCDM2BHx+rUg6f9EsOqL/KCuHyiXlsx96fP8EGI0RxAXRAA2KE2pAZEtoqMAcMtPdEafa92ayyvmnmN/qF9QqGK2QBdvlnXGG5YpLLNmlWGoZPuBAUafbnf0P8jyReH1xoGqLPktiTa7zottL3qc6dYBimT8eMRgPdK1tQ5ud9Fyfg3267HsUnB2UlFZpO8o7j9EPNCrRmxPWIOFjV16vsljaDs7xoIsFyiubYfEqvpurS+YIa9ewigaVxZ3YULt/E6gV4JUMtFcYdJH9e+/VqfqGoPb44Kj7lv6EnpZt"
`endif