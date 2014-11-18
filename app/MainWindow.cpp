
#include "MainWindow.h"
#include <ui_mainwindow.h>
MainWindow::MainWindow(QWidget* parent):
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this) ;
    setWindowTitle("Initial CMake Qt App ") ;

}

MainWindow::~MainWindow() {
    delete ui ;
}
