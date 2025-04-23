from PySide6.QtWidgets import QApplication
from PySide6.QtUiTools import QUiLoader


def data_selecionada():
    x = str(tela.calendario.selectedDate())
    y = x[19:30]
    print(x, y)
    tela.lbl_data.setText(y)


app = QApplication()

loader = QUiLoader()
tela = loader.load('calendario.ui')

tela.calendario.selectionChanged.connect(data_selecionada)

tela.show()

app.exec()
