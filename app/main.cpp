#include <iostream>
#include <config.h>
#include <lib.h>
#include <QApplication>
#include <MainWindow.h>


int myAppHelper() {
    return 1 ;
}

int main(int argc , char* args[]) {
    std::cout<<"in main function" << " "<<APP_VERSION << " " << APP_RELEASE << std::endl ;
    std::cout <<"myAppHelper() "  << myAppHelper() << std::endl ;
    std::cout <<"myLibHelper() "  << myLibHelper() << std::endl ;

    QApplication app(argc,args) ;

    MainWindow mainWindow ;

    mainWindow.show() ;

    return app.exec() ;

}
