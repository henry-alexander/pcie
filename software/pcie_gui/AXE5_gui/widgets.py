import sys
from PySide6.QtWidgets import QWidget, QApplication
from PySide6.QtGui import QPainter, QColor, QBrush, QRadialGradient
from PySide6.QtCore import Qt, QPointF

class RGBLedWidget(QWidget):
    def __init__(self, parent = None, color = None, *args, **kwargs):
        super().__init__(parent, *args, **kwargs)
        self.color = color if color is not None else QColor(50, 50, 50)

    def paintEvent(self, event):
        painter = QPainter(self)
        painter.setRenderHint(QPainter.Antialiasing)

        # Calculate gradient colors
        gradient_colors = [Qt.white, self.color]

        # Draw LED background
        painter.setPen(Qt.NoPen)
        painter.setBrush(Qt.black)
        painter.drawEllipse(self.rect())

        # Draw gradient
        print(self.rect().width())
        print(gradient_colors)
        gradient = QRadialGradient(QPointF(0,0), self.rect().width())
        gradient.setColorAt(0, gradient_colors[0])
        gradient.setColorAt(1, gradient_colors[1])
        painter.setBrush(QBrush(gradient))
        led_rect = self.rect().adjusted(2, 2, -2, -2)
        painter.drawEllipse(led_rect)

    def set_color(self, color):
        self.color = color
        self.update()

        

if __name__ == "__main__":
    app = QApplication(sys.argv)
    initial_color = QColor()
    widget = RGBLedWidget(initial_color)
    widget.setGeometry(100, 100, 100, 100)
    widget.show()
    from time import sleep
    sleep(2)

    # Example of updating color dynamically
    updated_color = QColor(255, 0, 0)  # Example: red color
    widget.set_color(updated_color)

    sys.exit(app.exec())