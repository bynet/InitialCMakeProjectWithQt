#ifndef __MAINWINDOW_H__
#define __MAINWINDOW_H__
#include <QMainWindow>
#include <MainWindow.h>
#include <ui_dlg.h>

namespace Ui {
    class MainWindow;
}

class MainWindow:public QMainWindow {
    Q_OBJECT

public:
    explicit MainWindow(QWidget* parent = 0) ;
    ~MainWindow() ;

private:
    Ui::MainWindow* ui ;

} ;


#endif
