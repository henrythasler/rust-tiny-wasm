// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#![allow(unused_imports)]
#![allow(non_snake_case)]
#![allow(non_camel_case_types)]
#![allow(irrefutable_let_patterns)]
#![allow(unused_comparisons)]

extern crate kaitai;
use kaitai::*;
use std::cell::{Cell, Ref, RefCell};
use std::convert::{TryFrom, TryInto};
use std::rc::{Rc, Weak};

/**
 * A variable-length unsigned integer using base128 encoding. 1-byte groups
 * consists of 1-bit flag of continuation and 7-bit value, and are ordered
 * least significant group first, i.e. in little-endian manner
 * (https://github.com/kaitai-io/kaitai_struct_formats/blob/master/common/vlq_base128_le.ksy)
 */

#[derive(Default, Debug, Clone)]
pub struct VlqBase128Le {
    pub _root: SharedType<VlqBase128Le>,
    pub _parent: SharedType<VlqBase128Le>,
    pub _self: SharedType<Self>,
    groups: RefCell<Vec<OptRc<VlqBase128Le_Group>>>,
    _io: RefCell<BytesReader>,
    f_len: Cell<bool>,
    len: RefCell<i32>,
    f_value: Cell<bool>,
    value: RefCell<i32>,
}
impl KStruct for VlqBase128Le {
    type Root = VlqBase128Le;
    type Parent = VlqBase128Le;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.groups.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, VlqBase128Le_Group>(
                    &*_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                self_rc.groups.borrow_mut().push(t);
                let _t_groups = self_rc.groups.borrow();
                let _tmpa = _t_groups.last().unwrap();
                _i += 1;
                let x = !(!(*_tmpa.has_next()?));
                x
            } {}
        }
        Ok(())
    }
}
impl VlqBase128Le {
    pub fn len(&self) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len.get() {
            return Ok(self.len.borrow());
        }
        self.f_len.set(true);
        *self.len.borrow_mut() = (self.groups().len()) as i32;
        Ok(self.len.borrow())
    }

    /**
     * Resulting value as normal integer
     */
    pub fn value(&self) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        *self.value.borrow_mut() = ((((((((((((((*self.groups()[0 as usize].value()? as i32)
            + (if ((*self.len()? as i32) >= (2 as i32)) {
                ((*self.groups()[1 as usize].value()? as i64) << (7 as i32))
            } else {
                0
            } as i32)) as i32)
            + (if ((*self.len()? as i32) >= (3 as i32)) {
                ((*self.groups()[2 as usize].value()? as i64) << (14 as i32))
            } else {
                0
            } as i32)) as i32)
            + (if ((*self.len()? as i32) >= (4 as i32)) {
                ((*self.groups()[3 as usize].value()? as i64) << (21 as i32))
            } else {
                0
            } as i32)) as i32)
            + (if ((*self.len()? as i32) >= (5 as i32)) {
                ((*self.groups()[4 as usize].value()? as i64) << (28 as i32))
            } else {
                0
            } as i32)) as i32)
            + (if ((*self.len()? as i32) >= (6 as i32)) {
                ((*self.groups()[5 as usize].value()? as i64) << (35 as i32))
            } else {
                0
            } as i32)) as i32)
            + (if ((*self.len()? as i32) >= (7 as i32)) {
                ((*self.groups()[6 as usize].value()? as i64) << (42 as i32))
            } else {
                0
            } as i32)) as i32)
            + (if ((*self.len()? as i32) >= (8 as i32)) {
                ((*self.groups()[7 as usize].value()? as i64) << (49 as i32))
            } else {
                0
            } as i32)) as i32;
        Ok(self.value.borrow())
    }
}
impl VlqBase128Le {
    pub fn groups(&self) -> Ref<'_, Vec<OptRc<VlqBase128Le_Group>>> {
        self.groups.borrow()
    }
}
impl VlqBase128Le {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * One byte group, clearly divided into 7-bit "value" and 1-bit "has continuation
 * in the next byte" flag.
 */

#[derive(Default, Debug, Clone)]
pub struct VlqBase128Le_Group {
    pub _root: SharedType<VlqBase128Le>,
    pub _parent: SharedType<VlqBase128Le>,
    pub _self: SharedType<Self>,
    b: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_has_next: Cell<bool>,
    has_next: RefCell<bool>,
    f_value: Cell<bool>,
    value: RefCell<i32>,
}
impl KStruct for VlqBase128Le_Group {
    type Root = VlqBase128Le;
    type Parent = VlqBase128Le;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.b.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl VlqBase128Le_Group {
    /**
     * If true, then we have more bytes to read
     */
    pub fn has_next(&self) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_next.get() {
            return Ok(self.has_next.borrow());
        }
        self.f_has_next.set(true);
        *self.has_next.borrow_mut() =
            ((((*self.b() as u8) & (128 as u8)) as i32) != (0 as i32)) as bool;
        Ok(self.has_next.borrow())
    }

    /**
     * The 7-bit (base128) numeric value of this group
     */
    pub fn value(&self) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        *self.value.borrow_mut() = ((*self.b() as u8) & (127 as u8)) as i32;
        Ok(self.value.borrow())
    }
}
impl VlqBase128Le_Group {
    pub fn b(&self) -> Ref<'_, u8> {
        self.b.borrow()
    }
}
impl VlqBase128Le_Group {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
