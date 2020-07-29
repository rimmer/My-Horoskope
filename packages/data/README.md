# Data modules

Data is an object that used to transfer, serialize and control information.

Data can have any objects inside of it, but it must be serialazible in any way.

This modules are datas or data controllers that divided on two main groups.

## Abstract Data:

Abstract datas are independent interfaces of data and data controllers which used around other modules.
Abstract data module often has a concrete, **serialization ready** data entitiy.

## Platform-specific

Platform datas are implementations of abstract datas. For example, *_flutter is used in mobile_app module.