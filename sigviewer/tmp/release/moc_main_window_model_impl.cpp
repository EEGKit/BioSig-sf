/****************************************************************************
** Meta object code from reading C++ file 'main_window_model_impl.h'
**
** Created: Thu Mar 28 15:11:59 2013
**      by: The Qt Meta Object Compiler version 62 (Qt 4.6.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/gui_impl/main_window_model_impl.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'main_window_model_impl.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.6.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_SigViewer___MainWindowModelImpl[] = {

 // content:
       4,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      43,   33,   32,   32, 0x0a,
      59,   33,   32,   32, 0x0a,
      92,   73,   32,   32, 0x08,
     122,   32,   32,   32, 0x08,
     160,  150,   32,   32, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_SigViewer___MainWindowModelImpl[] = {
    "SigViewer_::MainWindowModelImpl\0\0"
    "tab_index\0tabChanged(int)\0closeTab(int)\0"
    "recent_file_action\0recentFileActivated(QAction*)\0"
    "recentFileMenuAboutToShow()\0file_name\0"
    "resetCurrentFileName(QString)\0"
};

const QMetaObject SigViewer_::MainWindowModelImpl::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_SigViewer___MainWindowModelImpl,
      qt_meta_data_SigViewer___MainWindowModelImpl, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &SigViewer_::MainWindowModelImpl::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *SigViewer_::MainWindowModelImpl::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *SigViewer_::MainWindowModelImpl::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_SigViewer___MainWindowModelImpl))
        return static_cast<void*>(const_cast< MainWindowModelImpl*>(this));
    if (!strcmp(_clname, "MainWindowModel"))
        return static_cast< MainWindowModel*>(const_cast< MainWindowModelImpl*>(this));
    return QObject::qt_metacast(_clname);
}

int SigViewer_::MainWindowModelImpl::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: tabChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 1: closeTab((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 2: recentFileActivated((*reinterpret_cast< QAction*(*)>(_a[1]))); break;
        case 3: recentFileMenuAboutToShow(); break;
        case 4: resetCurrentFileName((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        default: ;
        }
        _id -= 5;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
