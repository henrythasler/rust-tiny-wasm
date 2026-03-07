// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#![allow(unused_imports)]
#![allow(non_snake_case)]
#![allow(non_camel_case_types)]
#![allow(irrefutable_let_patterns)]
#![allow(unused_comparisons)]
// FIXME: remove ignore all clippy warnings, as this code is machine-generated
#![allow(clippy::all)]

extern crate kaitai;
use super::vlq_base128_le::VlqBase128Le;
use kaitai::*;
use std::cell::{Cell, Ref, RefCell};
use std::convert::{TryFrom, TryInto};
use std::rc::{Rc, Weak};

/**
 * This document describes the binary format of a WebAssembly module
 * following the version 1.0 of the core WebAssembly standard.
 *
 * Repository: https://github.com/henrythasler/wasm-kaitai-struct
 *
 * * Naming of entities follows the official specification.
 * * All integers are encoded using the LEB128 variable-length integer encoding (see vlq_base128_le.ksy).
 * * The schema follows the KSY Style Guide
 * * Requires ks-version 0.9+ because of attribute value validation
 * * types appear in the order in which they are required
 * \sa * https://www.w3.org/TR/wasm-core-1/
 */

#[derive(Default, Debug, Clone)]
pub struct Webassembly {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    version: RefCell<u32>,
    sections: RefCell<Vec<OptRc<Webassembly_Section>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly {
    type Root = Webassembly;
    type Parent = Webassembly;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic() == vec![0x0u8, 0x61u8, 0x73u8, 0x6du8]) {
            return Err(KError::ValidationFailed(ValidationFailedError {
                kind: ValidationKind::NotEqual,
                src_path: "/seq/0".to_string(),
            }));
        }
        *self_rc.version.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.sections.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Webassembly_Section>(
                    &*_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                self_rc.sections.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Webassembly {}

/**
 * Magic number identifying the file as a WebAssembly module
 * \sa https://www.w3.org/TR/wasm-core-1/#binary-magic Source
 */
impl Webassembly {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}

/**
 * Version of the WebAssembly binary format
 * \sa https://www.w3.org/TR/wasm-core-1/#binary-version Source
 */
impl Webassembly {
    pub fn version(&self) -> Ref<'_, u32> {
        self.version.borrow()
    }
}

/**
 * A WebAssembly module is a set of sections
 * \sa https://www.w3.org/TR/wasm-core-1/#binary-module Source
 */
impl Webassembly {
    pub fn sections(&self) -> Ref<'_, Vec<OptRc<Webassembly_Section>>> {
        self.sections.borrow()
    }
}
impl Webassembly {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Webassembly_ExportTypes {
    FuncType,
    TableType,
    MemType,
    GlobalType,
    Unknown(i64),
}

impl TryFrom<i64> for Webassembly_ExportTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Webassembly_ExportTypes> {
        match flag {
            0 => Ok(Webassembly_ExportTypes::FuncType),
            1 => Ok(Webassembly_ExportTypes::TableType),
            2 => Ok(Webassembly_ExportTypes::MemType),
            3 => Ok(Webassembly_ExportTypes::GlobalType),
            _ => Ok(Webassembly_ExportTypes::Unknown(flag)),
        }
    }
}

impl From<&Webassembly_ExportTypes> for i64 {
    fn from(v: &Webassembly_ExportTypes) -> Self {
        match *v {
            Webassembly_ExportTypes::FuncType => 0,
            Webassembly_ExportTypes::TableType => 1,
            Webassembly_ExportTypes::MemType => 2,
            Webassembly_ExportTypes::GlobalType => 3,
            Webassembly_ExportTypes::Unknown(v) => v,
        }
    }
}

impl Default for Webassembly_ExportTypes {
    fn default() -> Self {
        Webassembly_ExportTypes::Unknown(0)
    }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Webassembly_ImportTypes {
    FuncType,
    TableType,
    MemType,
    GlobalType,
    Unknown(i64),
}

impl TryFrom<i64> for Webassembly_ImportTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Webassembly_ImportTypes> {
        match flag {
            0 => Ok(Webassembly_ImportTypes::FuncType),
            1 => Ok(Webassembly_ImportTypes::TableType),
            2 => Ok(Webassembly_ImportTypes::MemType),
            3 => Ok(Webassembly_ImportTypes::GlobalType),
            _ => Ok(Webassembly_ImportTypes::Unknown(flag)),
        }
    }
}

impl From<&Webassembly_ImportTypes> for i64 {
    fn from(v: &Webassembly_ImportTypes) -> Self {
        match *v {
            Webassembly_ImportTypes::FuncType => 0,
            Webassembly_ImportTypes::TableType => 1,
            Webassembly_ImportTypes::MemType => 2,
            Webassembly_ImportTypes::GlobalType => 3,
            Webassembly_ImportTypes::Unknown(v) => v,
        }
    }
}

impl Default for Webassembly_ImportTypes {
    fn default() -> Self {
        Webassembly_ImportTypes::Unknown(0)
    }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Webassembly_MutabilityTypes {
    Const,
    Var,
    Unknown(i64),
}

impl TryFrom<i64> for Webassembly_MutabilityTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Webassembly_MutabilityTypes> {
        match flag {
            0 => Ok(Webassembly_MutabilityTypes::Const),
            1 => Ok(Webassembly_MutabilityTypes::Var),
            _ => Ok(Webassembly_MutabilityTypes::Unknown(flag)),
        }
    }
}

impl From<&Webassembly_MutabilityTypes> for i64 {
    fn from(v: &Webassembly_MutabilityTypes) -> Self {
        match *v {
            Webassembly_MutabilityTypes::Const => 0,
            Webassembly_MutabilityTypes::Var => 1,
            Webassembly_MutabilityTypes::Unknown(v) => v,
        }
    }
}

impl Default for Webassembly_MutabilityTypes {
    fn default() -> Self {
        Webassembly_MutabilityTypes::Unknown(0)
    }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Webassembly_SectionId {
    CustomSection,
    TypeSection,
    ImportSection,
    FunctionSection,
    TableSection,
    MemorySection,
    GlobalSection,
    ExportSection,
    StartSection,
    ElementSection,
    CodeSection,
    DataSection,
    Unknown(i64),
}

impl TryFrom<i64> for Webassembly_SectionId {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Webassembly_SectionId> {
        match flag {
            0 => Ok(Webassembly_SectionId::CustomSection),
            1 => Ok(Webassembly_SectionId::TypeSection),
            2 => Ok(Webassembly_SectionId::ImportSection),
            3 => Ok(Webassembly_SectionId::FunctionSection),
            4 => Ok(Webassembly_SectionId::TableSection),
            5 => Ok(Webassembly_SectionId::MemorySection),
            6 => Ok(Webassembly_SectionId::GlobalSection),
            7 => Ok(Webassembly_SectionId::ExportSection),
            8 => Ok(Webassembly_SectionId::StartSection),
            9 => Ok(Webassembly_SectionId::ElementSection),
            10 => Ok(Webassembly_SectionId::CodeSection),
            11 => Ok(Webassembly_SectionId::DataSection),
            _ => Ok(Webassembly_SectionId::Unknown(flag)),
        }
    }
}

impl From<&Webassembly_SectionId> for i64 {
    fn from(v: &Webassembly_SectionId) -> Self {
        match *v {
            Webassembly_SectionId::CustomSection => 0,
            Webassembly_SectionId::TypeSection => 1,
            Webassembly_SectionId::ImportSection => 2,
            Webassembly_SectionId::FunctionSection => 3,
            Webassembly_SectionId::TableSection => 4,
            Webassembly_SectionId::MemorySection => 5,
            Webassembly_SectionId::GlobalSection => 6,
            Webassembly_SectionId::ExportSection => 7,
            Webassembly_SectionId::StartSection => 8,
            Webassembly_SectionId::ElementSection => 9,
            Webassembly_SectionId::CodeSection => 10,
            Webassembly_SectionId::DataSection => 11,
            Webassembly_SectionId::Unknown(v) => v,
        }
    }
}

impl Default for Webassembly_SectionId {
    fn default() -> Self {
        Webassembly_SectionId::Unknown(0)
    }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Webassembly_Types {
    Function,
    Element,
    Unknown(i64),
}

impl TryFrom<i64> for Webassembly_Types {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Webassembly_Types> {
        match flag {
            96 => Ok(Webassembly_Types::Function),
            112 => Ok(Webassembly_Types::Element),
            _ => Ok(Webassembly_Types::Unknown(flag)),
        }
    }
}

impl From<&Webassembly_Types> for i64 {
    fn from(v: &Webassembly_Types) -> Self {
        match *v {
            Webassembly_Types::Function => 96,
            Webassembly_Types::Element => 112,
            Webassembly_Types::Unknown(v) => v,
        }
    }
}

impl Default for Webassembly_Types {
    fn default() -> Self {
        Webassembly_Types::Unknown(0)
    }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Webassembly_ValTypes {
    F64,
    F32,
    I64,
    I32,
    Unknown(i64),
}

impl TryFrom<i64> for Webassembly_ValTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Webassembly_ValTypes> {
        match flag {
            124 => Ok(Webassembly_ValTypes::F64),
            125 => Ok(Webassembly_ValTypes::F32),
            126 => Ok(Webassembly_ValTypes::I64),
            127 => Ok(Webassembly_ValTypes::I32),
            _ => Ok(Webassembly_ValTypes::Unknown(flag)),
        }
    }
}

impl From<&Webassembly_ValTypes> for i64 {
    fn from(v: &Webassembly_ValTypes) -> Self {
        match *v {
            Webassembly_ValTypes::F64 => 124,
            Webassembly_ValTypes::F32 => 125,
            Webassembly_ValTypes::I64 => 126,
            Webassembly_ValTypes::I32 => 127,
            Webassembly_ValTypes::Unknown(v) => v,
        }
    }
}

impl Default for Webassembly_ValTypes {
    fn default() -> Self {
        Webassembly_ValTypes::Unknown(0)
    }
}

#[derive(Default, Debug, Clone)]
pub struct Webassembly_Code {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_CodeSection>,
    pub _self: SharedType<Self>,
    len_func: RefCell<OptRc<VlqBase128Le>>,
    func: RefCell<OptRc<Webassembly_Func>>,
    _io: RefCell<BytesReader>,
    func_raw: RefCell<Vec<u8>>,
}
impl KStruct for Webassembly_Code {
    type Root = Webassembly;
    type Parent = Webassembly_CodeSection;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.len_func.borrow_mut() = t;
        *self_rc.func_raw.borrow_mut() = _io
            .read_bytes(*self_rc.len_func().value()? as usize)?
            .into();
        let func_raw = self_rc.func_raw.borrow();
        let _t_func_raw_io = BytesReader::from(func_raw.clone());
        let t = Self::read_into::<BytesReader, Webassembly_Func>(
            &_t_func_raw_io,
            Some(self_rc._root.clone()),
            Some(self_rc._self.clone()),
        )?
        .into();
        *self_rc.func.borrow_mut() = t;
        Ok(())
    }
}
impl Webassembly_Code {}
impl Webassembly_Code {
    pub fn len_func(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.len_func.borrow()
    }
}
impl Webassembly_Code {
    pub fn func(&self) -> Ref<'_, OptRc<Webassembly_Func>> {
        self.func.borrow()
    }
}
impl Webassembly_Code {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Webassembly_Code {
    pub fn func_raw(&self) -> Ref<'_, Vec<u8>> {
        self.func_raw.borrow()
    }
}

/**
 * (id 10) A vector of code entries
 * \sa https://www.w3.org/TR/wasm-core-1/#binary-codesec Source
 */

#[derive(Default, Debug, Clone)]
pub struct Webassembly_CodeSection {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_Section>,
    pub _self: SharedType<Self>,
    num_entries: RefCell<OptRc<VlqBase128Le>>,
    entries: RefCell<Vec<OptRc<Webassembly_Code>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_CodeSection {
    type Root = Webassembly;
    type Parent = Webassembly_Section;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.num_entries.borrow_mut() = t;
        *self_rc.entries.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Webassembly_Code>(
                    &*_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Webassembly_CodeSection {}
impl Webassembly_CodeSection {
    pub fn num_entries(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.num_entries.borrow()
    }
}
impl Webassembly_CodeSection {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Webassembly_Code>>> {
        self.entries.borrow()
    }
}
impl Webassembly_CodeSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * (id 0) - Custom section whose content is application-specific and not defined by the WebAssembly specification.
 * \sa https://www.w3.org/TR/wasm-core-1/#binary-customsec Source
 */

#[derive(Default, Debug, Clone)]
pub struct Webassembly_CustomSection {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_Section>,
    pub _self: SharedType<Self>,
    name: RefCell<OptRc<Webassembly_Name>>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_CustomSection {
    type Root = Webassembly;
    type Parent = Webassembly_Section;

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
        let t = Self::read_into::<_, Webassembly_Name>(&*_io, Some(self_rc._root.clone()), None)?
            .into();
        *self_rc.name.borrow_mut() = t;
        *self_rc.data.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl Webassembly_CustomSection {}
impl Webassembly_CustomSection {
    pub fn name(&self) -> Ref<'_, OptRc<Webassembly_Name>> {
        self.name.borrow()
    }
}

/**
 * Custom section data; out of scope for this schema
 */
impl Webassembly_CustomSection {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl Webassembly_CustomSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * (11) - Vector of data segments
 * \sa https://www.w3.org/TR/wasm-core-1/#binary-datasec Source
 */

#[derive(Default, Debug, Clone)]
pub struct Webassembly_DataSection {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_Section>,
    pub _self: SharedType<Self>,
    num_data: RefCell<OptRc<VlqBase128Le>>,
    data_segments: RefCell<Vec<OptRc<Webassembly_DataSegment>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_DataSection {
    type Root = Webassembly;
    type Parent = Webassembly_Section;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.num_data.borrow_mut() = t;
        *self_rc.data_segments.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Webassembly_DataSegment>(
                    &*_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                self_rc.data_segments.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Webassembly_DataSection {}
impl Webassembly_DataSection {
    pub fn num_data(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.num_data.borrow()
    }
}
impl Webassembly_DataSection {
    pub fn data_segments(&self) -> Ref<'_, Vec<OptRc<Webassembly_DataSegment>>> {
        self.data_segments.borrow()
    }
}
impl Webassembly_DataSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Webassembly_DataSegment {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_DataSection>,
    pub _self: SharedType<Self>,
    data_memidx: RefCell<OptRc<VlqBase128Le>>,
    offset_expr: RefCell<OptRc<Webassembly_Expression>>,
    num_init: RefCell<OptRc<VlqBase128Le>>,
    init_vec: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_DataSegment {
    type Root = Webassembly;
    type Parent = Webassembly_DataSection;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.data_memidx.borrow_mut() = t;
        let t =
            Self::read_into::<_, Webassembly_Expression>(&*_io, Some(self_rc._root.clone()), None)?
                .into();
        *self_rc.offset_expr.borrow_mut() = t;
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.num_init.borrow_mut() = t;
        *self_rc.init_vec.borrow_mut() = _io
            .read_bytes(*self_rc.num_init().value()? as usize)?
            .into();
        Ok(())
    }
}
impl Webassembly_DataSegment {}
impl Webassembly_DataSegment {
    pub fn data_memidx(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.data_memidx.borrow()
    }
}

/**
 * The offset is given by a constant expression that DOES NOT include an end marker
 * \sa https://www.w3.org/TR/wasm-core-1/#valid-constant Source
 */
impl Webassembly_DataSegment {
    pub fn offset_expr(&self) -> Ref<'_, OptRc<Webassembly_Expression>> {
        self.offset_expr.borrow()
    }
}
impl Webassembly_DataSegment {
    pub fn num_init(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.num_init.borrow()
    }
}
impl Webassembly_DataSegment {
    pub fn init_vec(&self) -> Ref<'_, Vec<u8>> {
        self.init_vec.borrow()
    }
}
impl Webassembly_DataSegment {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Webassembly_Element {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_ElementSection>,
    pub _self: SharedType<Self>,
    tableidx: RefCell<OptRc<VlqBase128Le>>,
    offset_expr: RefCell<OptRc<Webassembly_Expression>>,
    num_init: RefCell<OptRc<VlqBase128Le>>,
    init_vec: RefCell<Vec<OptRc<VlqBase128Le>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_Element {
    type Root = Webassembly;
    type Parent = Webassembly_ElementSection;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.tableidx.borrow_mut() = t;
        let t =
            Self::read_into::<_, Webassembly_Expression>(&*_io, Some(self_rc._root.clone()), None)?
                .into();
        *self_rc.offset_expr.borrow_mut() = t;
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.num_init.borrow_mut() = t;
        *self_rc.init_vec.borrow_mut() = Vec::new();
        let l_init_vec = *self_rc.num_init().value()?;
        for _i in 0..l_init_vec {
            let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
            self_rc.init_vec.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Webassembly_Element {}
impl Webassembly_Element {
    pub fn tableidx(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.tableidx.borrow()
    }
}

/**
 * The offset is given by a constant expression that DOES NOT include an end marker
 * \sa https://www.w3.org/TR/wasm-core-1/#valid-constant Source
 */
impl Webassembly_Element {
    pub fn offset_expr(&self) -> Ref<'_, OptRc<Webassembly_Expression>> {
        self.offset_expr.borrow()
    }
}
impl Webassembly_Element {
    pub fn num_init(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.num_init.borrow()
    }
}
impl Webassembly_Element {
    pub fn init_vec(&self) -> Ref<'_, Vec<OptRc<VlqBase128Le>>> {
        self.init_vec.borrow()
    }
}
impl Webassembly_Element {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * (id 9) - Vector of element sections
 * \sa https://www.w3.org/TR/wasm-core-1/#binary-elemsec Source
 */

#[derive(Default, Debug, Clone)]
pub struct Webassembly_ElementSection {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_Section>,
    pub _self: SharedType<Self>,
    num_elements: RefCell<OptRc<VlqBase128Le>>,
    elements: RefCell<Vec<OptRc<Webassembly_Element>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_ElementSection {
    type Root = Webassembly;
    type Parent = Webassembly_Section;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.num_elements.borrow_mut() = t;
        *self_rc.elements.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Webassembly_Element>(
                    &*_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                self_rc.elements.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Webassembly_ElementSection {}
impl Webassembly_ElementSection {
    pub fn num_elements(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.num_elements.borrow()
    }
}
impl Webassembly_ElementSection {
    pub fn elements(&self) -> Ref<'_, Vec<OptRc<Webassembly_Element>>> {
        self.elements.borrow()
    }
}
impl Webassembly_ElementSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Webassembly_Export {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_ExportSection>,
    pub _self: SharedType<Self>,
    name: RefCell<OptRc<Webassembly_Name>>,
    exportdesc: RefCell<Webassembly_ExportTypes>,
    idx: RefCell<OptRc<VlqBase128Le>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_Export {
    type Root = Webassembly;
    type Parent = Webassembly_ExportSection;

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
        let t = Self::read_into::<_, Webassembly_Name>(&*_io, Some(self_rc._root.clone()), None)?
            .into();
        *self_rc.name.borrow_mut() = t;
        *self_rc.exportdesc.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.idx.borrow_mut() = t;
        Ok(())
    }
}
impl Webassembly_Export {}
impl Webassembly_Export {
    pub fn name(&self) -> Ref<'_, OptRc<Webassembly_Name>> {
        self.name.borrow()
    }
}
impl Webassembly_Export {
    pub fn exportdesc(&self) -> Ref<'_, Webassembly_ExportTypes> {
        self.exportdesc.borrow()
    }
}
impl Webassembly_Export {
    pub fn idx(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.idx.borrow()
    }
}
impl Webassembly_Export {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * (id 7) - Exported entities
 * \sa https://www.w3.org/TR/wasm-core-1/#binary-exportsec Source
 */

#[derive(Default, Debug, Clone)]
pub struct Webassembly_ExportSection {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_Section>,
    pub _self: SharedType<Self>,
    num_exports: RefCell<OptRc<VlqBase128Le>>,
    exports: RefCell<Vec<OptRc<Webassembly_Export>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_ExportSection {
    type Root = Webassembly;
    type Parent = Webassembly_Section;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.num_exports.borrow_mut() = t;
        *self_rc.exports.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Webassembly_Export>(
                    &*_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                self_rc.exports.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Webassembly_ExportSection {}
impl Webassembly_ExportSection {
    pub fn num_exports(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.num_exports.borrow()
    }
}
impl Webassembly_ExportSection {
    pub fn exports(&self) -> Ref<'_, Vec<OptRc<Webassembly_Export>>> {
        self.exports.borrow()
    }
}
impl Webassembly_ExportSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Webassembly_Expression {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    bytes: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_Expression {
    type Root = Webassembly;
    type Parent = KStructUnit;

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
        *self_rc.bytes.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                self_rc.bytes.borrow_mut().push(_io.read_u1()?.into());
                let _t_bytes = self_rc.bytes.borrow();
                let _tmpa = *_t_bytes.last().unwrap();
                _i += 1;
                let x = !(((self_rc.bytes()[((self_rc.bytes().len() as i32) - (1 as i32)) as usize]
                    as u8)
                    == (11 as u8))
                    && (((self_rc.bytes().len() as i32) == (1 as i32))
                        || (self_rc.bytes()
                            [((self_rc.bytes().len() as i32) - (2 as i32)) as usize]
                            < 128)));
                x
            } {}
        }
        Ok(())
    }
}
impl Webassembly_Expression {}
impl Webassembly_Expression {
    pub fn bytes(&self) -> Ref<'_, Vec<u8>> {
        self.bytes.borrow()
    }
}
impl Webassembly_Expression {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Webassembly_Func {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_Code>,
    pub _self: SharedType<Self>,
    num_locals: RefCell<OptRc<VlqBase128Le>>,
    locals: RefCell<Vec<OptRc<Webassembly_Local>>>,
    expr: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_Func {
    type Root = Webassembly;
    type Parent = Webassembly_Code;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.num_locals.borrow_mut() = t;
        *self_rc.locals.borrow_mut() = Vec::new();
        let l_locals = *self_rc.num_locals().value()?;
        for _i in 0..l_locals {
            let t = Self::read_into::<_, Webassembly_Local>(
                &*_io,
                Some(self_rc._root.clone()),
                Some(self_rc._self.clone()),
            )?
            .into();
            self_rc.locals.borrow_mut().push(t);
        }
        *self_rc.expr.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl Webassembly_Func {}
impl Webassembly_Func {
    pub fn num_locals(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.num_locals.borrow()
    }
}
impl Webassembly_Func {
    pub fn locals(&self) -> Ref<'_, Vec<OptRc<Webassembly_Local>>> {
        self.locals.borrow()
    }
}
impl Webassembly_Func {
    pub fn expr(&self) -> Ref<'_, Vec<u8>> {
        self.expr.borrow()
    }
}
impl Webassembly_Func {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * (id 3) - Vector of type indices (see `Type Section`) for all functions in the `Code Section`
 * \sa https://www.w3.org/TR/wasm-core-1/#binary-funcsec Source
 */

#[derive(Default, Debug, Clone)]
pub struct Webassembly_FunctionSection {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_Section>,
    pub _self: SharedType<Self>,
    num_typeidx: RefCell<OptRc<VlqBase128Le>>,
    typeidx: RefCell<Vec<OptRc<VlqBase128Le>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_FunctionSection {
    type Root = Webassembly;
    type Parent = Webassembly_Section;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.num_typeidx.borrow_mut() = t;
        *self_rc.typeidx.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
                self_rc.typeidx.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Webassembly_FunctionSection {}
impl Webassembly_FunctionSection {
    pub fn num_typeidx(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.num_typeidx.borrow()
    }
}
impl Webassembly_FunctionSection {
    pub fn typeidx(&self) -> Ref<'_, Vec<OptRc<VlqBase128Le>>> {
        self.typeidx.borrow()
    }
}
impl Webassembly_FunctionSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Byte `0x60` followed by a vector of parameters and results
 * \sa https://www.w3.org/TR/wasm-core-1/#binary-functype Source
 */

#[derive(Default, Debug, Clone)]
pub struct Webassembly_Functype {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_TypeSection>,
    pub _self: SharedType<Self>,
    functype: RefCell<Webassembly_Types>,
    parameters: RefCell<OptRc<Webassembly_VecValtype>>,
    results: RefCell<OptRc<Webassembly_VecValtype>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_Functype {
    type Root = Webassembly;
    type Parent = Webassembly_TypeSection;

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
        *self_rc.functype.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        if !(*self_rc.functype() == Webassembly_Types::Function) {
            return Err(KError::ValidationFailed(ValidationFailedError {
                kind: ValidationKind::NotEqual,
                src_path: "/types/functype/seq/0".to_string(),
            }));
        }
        let t = Self::read_into::<_, Webassembly_VecValtype>(
            &*_io,
            Some(self_rc._root.clone()),
            Some(self_rc._self.clone()),
        )?
        .into();
        *self_rc.parameters.borrow_mut() = t;
        let t = Self::read_into::<_, Webassembly_VecValtype>(
            &*_io,
            Some(self_rc._root.clone()),
            Some(self_rc._self.clone()),
        )?
        .into();
        *self_rc.results.borrow_mut() = t;
        Ok(())
    }
}
impl Webassembly_Functype {}
impl Webassembly_Functype {
    pub fn functype(&self) -> Ref<'_, Webassembly_Types> {
        self.functype.borrow()
    }
}
impl Webassembly_Functype {
    pub fn parameters(&self) -> Ref<'_, OptRc<Webassembly_VecValtype>> {
        self.parameters.borrow()
    }
}
impl Webassembly_Functype {
    pub fn results(&self) -> Ref<'_, OptRc<Webassembly_VecValtype>> {
        self.results.borrow()
    }
}
impl Webassembly_Functype {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Webassembly_Global {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_GlobalSection>,
    pub _self: SharedType<Self>,
    valtype: RefCell<Webassembly_ValTypes>,
    mutability: RefCell<Webassembly_MutabilityTypes>,
    init_expr: RefCell<OptRc<Webassembly_Expression>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_Global {
    type Root = Webassembly;
    type Parent = Webassembly_GlobalSection;

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
        *self_rc.valtype.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.mutability.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        if !((*self_rc.mutability() == Webassembly_MutabilityTypes::Const)
            || (*self_rc.mutability() == Webassembly_MutabilityTypes::Var))
        {
            return Err(KError::ValidationFailed(ValidationFailedError {
                kind: ValidationKind::NotAnyOf,
                src_path: "/types/global/seq/1".to_string(),
            }));
        }
        let t =
            Self::read_into::<_, Webassembly_Expression>(&*_io, Some(self_rc._root.clone()), None)?
                .into();
        *self_rc.init_expr.borrow_mut() = t;
        Ok(())
    }
}
impl Webassembly_Global {}
impl Webassembly_Global {
    pub fn valtype(&self) -> Ref<'_, Webassembly_ValTypes> {
        self.valtype.borrow()
    }
}
impl Webassembly_Global {
    pub fn mutability(&self) -> Ref<'_, Webassembly_MutabilityTypes> {
        self.mutability.borrow()
    }
}
impl Webassembly_Global {
    pub fn init_expr(&self) -> Ref<'_, OptRc<Webassembly_Expression>> {
        self.init_expr.borrow()
    }
}
impl Webassembly_Global {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Webassembly_GlobalImport {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_Import>,
    pub _self: SharedType<Self>,
    valtype: RefCell<Webassembly_ValTypes>,
    mutability: RefCell<Webassembly_MutabilityTypes>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_GlobalImport {
    type Root = Webassembly;
    type Parent = Webassembly_Import;

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
        *self_rc.valtype.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.mutability.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        if !((*self_rc.mutability() == Webassembly_MutabilityTypes::Const)
            || (*self_rc.mutability() == Webassembly_MutabilityTypes::Var))
        {
            return Err(KError::ValidationFailed(ValidationFailedError {
                kind: ValidationKind::NotAnyOf,
                src_path: "/types/global_import/seq/1".to_string(),
            }));
        }
        Ok(())
    }
}
impl Webassembly_GlobalImport {}
impl Webassembly_GlobalImport {
    pub fn valtype(&self) -> Ref<'_, Webassembly_ValTypes> {
        self.valtype.borrow()
    }
}
impl Webassembly_GlobalImport {
    pub fn mutability(&self) -> Ref<'_, Webassembly_MutabilityTypes> {
        self.mutability.borrow()
    }
}
impl Webassembly_GlobalImport {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * (id 6) Vector of globals
 * \sa https://www.w3.org/TR/wasm-core-1/#binary-memsec Source
 */

#[derive(Default, Debug, Clone)]
pub struct Webassembly_GlobalSection {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_Section>,
    pub _self: SharedType<Self>,
    num_globals: RefCell<OptRc<VlqBase128Le>>,
    globals: RefCell<Vec<OptRc<Webassembly_Global>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_GlobalSection {
    type Root = Webassembly;
    type Parent = Webassembly_Section;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.num_globals.borrow_mut() = t;
        *self_rc.globals.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Webassembly_Global>(
                    &*_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                self_rc.globals.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Webassembly_GlobalSection {}
impl Webassembly_GlobalSection {
    pub fn num_globals(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.num_globals.borrow()
    }
}
impl Webassembly_GlobalSection {
    pub fn globals(&self) -> Ref<'_, Vec<OptRc<Webassembly_Global>>> {
        self.globals.borrow()
    }
}
impl Webassembly_GlobalSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * An element of the import section
 */

#[derive(Default, Debug, Clone)]
pub struct Webassembly_Import {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_ImportSection>,
    pub _self: SharedType<Self>,
    module: RefCell<OptRc<Webassembly_Name>>,
    name: RefCell<OptRc<Webassembly_Name>>,
    import_type: RefCell<Webassembly_ImportTypes>,
    importdesc: RefCell<Option<Webassembly_Import_Importdesc>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Webassembly_Import_Importdesc {
    VlqBase128Le(OptRc<VlqBase128Le>),
    Webassembly_GlobalImport(OptRc<Webassembly_GlobalImport>),
    Webassembly_Memory(OptRc<Webassembly_Memory>),
    Webassembly_Table(OptRc<Webassembly_Table>),
}
impl From<&Webassembly_Import_Importdesc> for OptRc<VlqBase128Le> {
    fn from(v: &Webassembly_Import_Importdesc) -> Self {
        if let Webassembly_Import_Importdesc::VlqBase128Le(x) = v {
            return x.clone();
        }
        panic!(
            "expected Webassembly_Import_Importdesc::VlqBase128Le, got {:?}",
            v
        )
    }
}
impl From<OptRc<VlqBase128Le>> for Webassembly_Import_Importdesc {
    fn from(v: OptRc<VlqBase128Le>) -> Self {
        Self::VlqBase128Le(v)
    }
}
impl From<&Webassembly_Import_Importdesc> for OptRc<Webassembly_GlobalImport> {
    fn from(v: &Webassembly_Import_Importdesc) -> Self {
        if let Webassembly_Import_Importdesc::Webassembly_GlobalImport(x) = v {
            return x.clone();
        }
        panic!(
            "expected Webassembly_Import_Importdesc::Webassembly_GlobalImport, got {:?}",
            v
        )
    }
}
impl From<OptRc<Webassembly_GlobalImport>> for Webassembly_Import_Importdesc {
    fn from(v: OptRc<Webassembly_GlobalImport>) -> Self {
        Self::Webassembly_GlobalImport(v)
    }
}
impl From<&Webassembly_Import_Importdesc> for OptRc<Webassembly_Memory> {
    fn from(v: &Webassembly_Import_Importdesc) -> Self {
        if let Webassembly_Import_Importdesc::Webassembly_Memory(x) = v {
            return x.clone();
        }
        panic!(
            "expected Webassembly_Import_Importdesc::Webassembly_Memory, got {:?}",
            v
        )
    }
}
impl From<OptRc<Webassembly_Memory>> for Webassembly_Import_Importdesc {
    fn from(v: OptRc<Webassembly_Memory>) -> Self {
        Self::Webassembly_Memory(v)
    }
}
impl From<&Webassembly_Import_Importdesc> for OptRc<Webassembly_Table> {
    fn from(v: &Webassembly_Import_Importdesc) -> Self {
        if let Webassembly_Import_Importdesc::Webassembly_Table(x) = v {
            return x.clone();
        }
        panic!(
            "expected Webassembly_Import_Importdesc::Webassembly_Table, got {:?}",
            v
        )
    }
}
impl From<OptRc<Webassembly_Table>> for Webassembly_Import_Importdesc {
    fn from(v: OptRc<Webassembly_Table>) -> Self {
        Self::Webassembly_Table(v)
    }
}
impl KStruct for Webassembly_Import {
    type Root = Webassembly;
    type Parent = Webassembly_ImportSection;

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
        let t = Self::read_into::<_, Webassembly_Name>(&*_io, Some(self_rc._root.clone()), None)?
            .into();
        *self_rc.module.borrow_mut() = t;
        let t = Self::read_into::<_, Webassembly_Name>(&*_io, Some(self_rc._root.clone()), None)?
            .into();
        *self_rc.name.borrow_mut() = t;
        *self_rc.import_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        match *self_rc.import_type() {
            Webassembly_ImportTypes::FuncType => {
                let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
                *self_rc.importdesc.borrow_mut() = Some(t);
            }
            Webassembly_ImportTypes::GlobalType => {
                let t = Self::read_into::<_, Webassembly_GlobalImport>(
                    &*_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                *self_rc.importdesc.borrow_mut() = Some(t);
            }
            Webassembly_ImportTypes::MemType => {
                let t = Self::read_into::<_, Webassembly_Memory>(
                    &*_io,
                    Some(self_rc._root.clone()),
                    None,
                )?
                .into();
                *self_rc.importdesc.borrow_mut() = Some(t);
            }
            Webassembly_ImportTypes::TableType => {
                let t = Self::read_into::<_, Webassembly_Table>(
                    &*_io,
                    Some(self_rc._root.clone()),
                    None,
                )?
                .into();
                *self_rc.importdesc.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Webassembly_Import {}
impl Webassembly_Import {
    pub fn module(&self) -> Ref<'_, OptRc<Webassembly_Name>> {
        self.module.borrow()
    }
}
impl Webassembly_Import {
    pub fn name(&self) -> Ref<'_, OptRc<Webassembly_Name>> {
        self.name.borrow()
    }
}
impl Webassembly_Import {
    pub fn import_type(&self) -> Ref<'_, Webassembly_ImportTypes> {
        self.import_type.borrow()
    }
}
impl Webassembly_Import {
    pub fn importdesc(&self) -> Ref<'_, Option<Webassembly_Import_Importdesc>> {
        self.importdesc.borrow()
    }
}
impl Webassembly_Import {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * (id 2) - Imported components
 * \sa https://www.w3.org/TR/wasm-core-1/#binary-importsec Source
 */

#[derive(Default, Debug, Clone)]
pub struct Webassembly_ImportSection {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_Section>,
    pub _self: SharedType<Self>,
    num_imports: RefCell<OptRc<VlqBase128Le>>,
    imports: RefCell<Vec<OptRc<Webassembly_Import>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_ImportSection {
    type Root = Webassembly;
    type Parent = Webassembly_Section;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.num_imports.borrow_mut() = t;
        *self_rc.imports.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Webassembly_Import>(
                    &*_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                self_rc.imports.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Webassembly_ImportSection {}
impl Webassembly_ImportSection {
    pub fn num_imports(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.num_imports.borrow()
    }
}
impl Webassembly_ImportSection {
    pub fn imports(&self) -> Ref<'_, Vec<OptRc<Webassembly_Import>>> {
        self.imports.borrow()
    }
}
impl Webassembly_ImportSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Webassembly_Limits {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    flags: RefCell<u8>,
    min: RefCell<OptRc<VlqBase128Le>>,
    max: RefCell<OptRc<VlqBase128Le>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_Limits {
    type Root = Webassembly;
    type Parent = KStructUnit;

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
        *self_rc.flags.borrow_mut() = _io.read_u1()?.into();
        if !(((*self_rc.flags() as u8) == (0 as u8)) || ((*self_rc.flags() as u8) == (1 as u8))) {
            return Err(KError::ValidationFailed(ValidationFailedError {
                kind: ValidationKind::NotAnyOf,
                src_path: "/types/limits/seq/0".to_string(),
            }));
        }
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.min.borrow_mut() = t;
        if (*self_rc.flags() as u8) == (1 as u8) {
            let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
            *self_rc.max.borrow_mut() = t;
        }
        Ok(())
    }
}
impl Webassembly_Limits {}
impl Webassembly_Limits {
    pub fn flags(&self) -> Ref<'_, u8> {
        self.flags.borrow()
    }
}
impl Webassembly_Limits {
    pub fn min(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.min.borrow()
    }
}
impl Webassembly_Limits {
    pub fn max(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.max.borrow()
    }
}
impl Webassembly_Limits {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Webassembly_Local {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_Func>,
    pub _self: SharedType<Self>,
    num_valtype: RefCell<OptRc<VlqBase128Le>>,
    valtype: RefCell<Webassembly_ValTypes>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_Local {
    type Root = Webassembly;
    type Parent = Webassembly_Func;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.num_valtype.borrow_mut() = t;
        *self_rc.valtype.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        Ok(())
    }
}
impl Webassembly_Local {}
impl Webassembly_Local {
    pub fn num_valtype(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.num_valtype.borrow()
    }
}
impl Webassembly_Local {
    pub fn valtype(&self) -> Ref<'_, Webassembly_ValTypes> {
        self.valtype.borrow()
    }
}
impl Webassembly_Local {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Webassembly_Memory {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    limits: RefCell<OptRc<Webassembly_Limits>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_Memory {
    type Root = Webassembly;
    type Parent = KStructUnit;

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
        let t = Self::read_into::<_, Webassembly_Limits>(&*_io, Some(self_rc._root.clone()), None)?
            .into();
        *self_rc.limits.borrow_mut() = t;
        Ok(())
    }
}
impl Webassembly_Memory {}
impl Webassembly_Memory {
    pub fn limits(&self) -> Ref<'_, OptRc<Webassembly_Limits>> {
        self.limits.borrow()
    }
}
impl Webassembly_Memory {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * (id 5) Vector of memories
 * \sa https://www.w3.org/TR/wasm-core-1/#binary-memsec Source
 */

#[derive(Default, Debug, Clone)]
pub struct Webassembly_MemorySection {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_Section>,
    pub _self: SharedType<Self>,
    num_memories: RefCell<OptRc<VlqBase128Le>>,
    memories: RefCell<Vec<OptRc<Webassembly_Memory>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_MemorySection {
    type Root = Webassembly;
    type Parent = Webassembly_Section;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.num_memories.borrow_mut() = t;
        *self_rc.memories.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Webassembly_Memory>(
                    &*_io,
                    Some(self_rc._root.clone()),
                    None,
                )?
                .into();
                self_rc.memories.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Webassembly_MemorySection {}
impl Webassembly_MemorySection {
    pub fn num_memories(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.num_memories.borrow()
    }
}
impl Webassembly_MemorySection {
    pub fn memories(&self) -> Ref<'_, Vec<OptRc<Webassembly_Memory>>> {
        self.memories.borrow()
    }
}
impl Webassembly_MemorySection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * UTF-8 encoded character sequence
 * \sa https://www.w3.org/TR/wasm-core-1/#binary-name Source
 */

#[derive(Default, Debug, Clone)]
pub struct Webassembly_Name {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    length: RefCell<OptRc<VlqBase128Le>>,
    value: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_Name {
    type Root = Webassembly;
    type Parent = KStructUnit;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.length.borrow_mut() = t;
        *self_rc.value.borrow_mut() = bytes_to_str(
            &_io.read_bytes(*self_rc.length().value()? as usize)?.into(),
            "UTF-8",
        )?;
        Ok(())
    }
}
impl Webassembly_Name {}
impl Webassembly_Name {
    pub fn length(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.length.borrow()
    }
}
impl Webassembly_Name {
    pub fn value(&self) -> Ref<'_, String> {
        self.value.borrow()
    }
}
impl Webassembly_Name {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A specific section as part of a module
 * \sa https://www.w3.org/TR/wasm-core-1/#binary-section Source
 */

#[derive(Default, Debug, Clone)]
pub struct Webassembly_Section {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly>,
    pub _self: SharedType<Self>,
    id: RefCell<Webassembly_SectionId>,
    len_content: RefCell<OptRc<VlqBase128Le>>,
    content: RefCell<Option<Webassembly_Section_Content>>,
    _io: RefCell<BytesReader>,
    content_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum Webassembly_Section_Content {
    Webassembly_GlobalSection(OptRc<Webassembly_GlobalSection>),
    Webassembly_CustomSection(OptRc<Webassembly_CustomSection>),
    Webassembly_MemorySection(OptRc<Webassembly_MemorySection>),
    Webassembly_ElementSection(OptRc<Webassembly_ElementSection>),
    Webassembly_TableSection(OptRc<Webassembly_TableSection>),
    Webassembly_FunctionSection(OptRc<Webassembly_FunctionSection>),
    Webassembly_ExportSection(OptRc<Webassembly_ExportSection>),
    Bytes(Vec<u8>),
    Webassembly_CodeSection(OptRc<Webassembly_CodeSection>),
    Webassembly_ImportSection(OptRc<Webassembly_ImportSection>),
    Webassembly_TypeSection(OptRc<Webassembly_TypeSection>),
    Webassembly_StartSection(OptRc<Webassembly_StartSection>),
    Webassembly_DataSection(OptRc<Webassembly_DataSection>),
}
impl From<&Webassembly_Section_Content> for OptRc<Webassembly_GlobalSection> {
    fn from(v: &Webassembly_Section_Content) -> Self {
        if let Webassembly_Section_Content::Webassembly_GlobalSection(x) = v {
            return x.clone();
        }
        panic!(
            "expected Webassembly_Section_Content::Webassembly_GlobalSection, got {:?}",
            v
        )
    }
}
impl From<OptRc<Webassembly_GlobalSection>> for Webassembly_Section_Content {
    fn from(v: OptRc<Webassembly_GlobalSection>) -> Self {
        Self::Webassembly_GlobalSection(v)
    }
}
impl From<&Webassembly_Section_Content> for OptRc<Webassembly_CustomSection> {
    fn from(v: &Webassembly_Section_Content) -> Self {
        if let Webassembly_Section_Content::Webassembly_CustomSection(x) = v {
            return x.clone();
        }
        panic!(
            "expected Webassembly_Section_Content::Webassembly_CustomSection, got {:?}",
            v
        )
    }
}
impl From<OptRc<Webassembly_CustomSection>> for Webassembly_Section_Content {
    fn from(v: OptRc<Webassembly_CustomSection>) -> Self {
        Self::Webassembly_CustomSection(v)
    }
}
impl From<&Webassembly_Section_Content> for OptRc<Webassembly_MemorySection> {
    fn from(v: &Webassembly_Section_Content) -> Self {
        if let Webassembly_Section_Content::Webassembly_MemorySection(x) = v {
            return x.clone();
        }
        panic!(
            "expected Webassembly_Section_Content::Webassembly_MemorySection, got {:?}",
            v
        )
    }
}
impl From<OptRc<Webassembly_MemorySection>> for Webassembly_Section_Content {
    fn from(v: OptRc<Webassembly_MemorySection>) -> Self {
        Self::Webassembly_MemorySection(v)
    }
}
impl From<&Webassembly_Section_Content> for OptRc<Webassembly_ElementSection> {
    fn from(v: &Webassembly_Section_Content) -> Self {
        if let Webassembly_Section_Content::Webassembly_ElementSection(x) = v {
            return x.clone();
        }
        panic!(
            "expected Webassembly_Section_Content::Webassembly_ElementSection, got {:?}",
            v
        )
    }
}
impl From<OptRc<Webassembly_ElementSection>> for Webassembly_Section_Content {
    fn from(v: OptRc<Webassembly_ElementSection>) -> Self {
        Self::Webassembly_ElementSection(v)
    }
}
impl From<&Webassembly_Section_Content> for OptRc<Webassembly_TableSection> {
    fn from(v: &Webassembly_Section_Content) -> Self {
        if let Webassembly_Section_Content::Webassembly_TableSection(x) = v {
            return x.clone();
        }
        panic!(
            "expected Webassembly_Section_Content::Webassembly_TableSection, got {:?}",
            v
        )
    }
}
impl From<OptRc<Webassembly_TableSection>> for Webassembly_Section_Content {
    fn from(v: OptRc<Webassembly_TableSection>) -> Self {
        Self::Webassembly_TableSection(v)
    }
}
impl From<&Webassembly_Section_Content> for OptRc<Webassembly_FunctionSection> {
    fn from(v: &Webassembly_Section_Content) -> Self {
        if let Webassembly_Section_Content::Webassembly_FunctionSection(x) = v {
            return x.clone();
        }
        panic!(
            "expected Webassembly_Section_Content::Webassembly_FunctionSection, got {:?}",
            v
        )
    }
}
impl From<OptRc<Webassembly_FunctionSection>> for Webassembly_Section_Content {
    fn from(v: OptRc<Webassembly_FunctionSection>) -> Self {
        Self::Webassembly_FunctionSection(v)
    }
}
impl From<&Webassembly_Section_Content> for OptRc<Webassembly_ExportSection> {
    fn from(v: &Webassembly_Section_Content) -> Self {
        if let Webassembly_Section_Content::Webassembly_ExportSection(x) = v {
            return x.clone();
        }
        panic!(
            "expected Webassembly_Section_Content::Webassembly_ExportSection, got {:?}",
            v
        )
    }
}
impl From<OptRc<Webassembly_ExportSection>> for Webassembly_Section_Content {
    fn from(v: OptRc<Webassembly_ExportSection>) -> Self {
        Self::Webassembly_ExportSection(v)
    }
}
impl From<&Webassembly_Section_Content> for Vec<u8> {
    fn from(v: &Webassembly_Section_Content) -> Self {
        if let Webassembly_Section_Content::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Webassembly_Section_Content::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Webassembly_Section_Content {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&Webassembly_Section_Content> for OptRc<Webassembly_CodeSection> {
    fn from(v: &Webassembly_Section_Content) -> Self {
        if let Webassembly_Section_Content::Webassembly_CodeSection(x) = v {
            return x.clone();
        }
        panic!(
            "expected Webassembly_Section_Content::Webassembly_CodeSection, got {:?}",
            v
        )
    }
}
impl From<OptRc<Webassembly_CodeSection>> for Webassembly_Section_Content {
    fn from(v: OptRc<Webassembly_CodeSection>) -> Self {
        Self::Webassembly_CodeSection(v)
    }
}
impl From<&Webassembly_Section_Content> for OptRc<Webassembly_ImportSection> {
    fn from(v: &Webassembly_Section_Content) -> Self {
        if let Webassembly_Section_Content::Webassembly_ImportSection(x) = v {
            return x.clone();
        }
        panic!(
            "expected Webassembly_Section_Content::Webassembly_ImportSection, got {:?}",
            v
        )
    }
}
impl From<OptRc<Webassembly_ImportSection>> for Webassembly_Section_Content {
    fn from(v: OptRc<Webassembly_ImportSection>) -> Self {
        Self::Webassembly_ImportSection(v)
    }
}
impl From<&Webassembly_Section_Content> for OptRc<Webassembly_TypeSection> {
    fn from(v: &Webassembly_Section_Content) -> Self {
        if let Webassembly_Section_Content::Webassembly_TypeSection(x) = v {
            return x.clone();
        }
        panic!(
            "expected Webassembly_Section_Content::Webassembly_TypeSection, got {:?}",
            v
        )
    }
}
impl From<OptRc<Webassembly_TypeSection>> for Webassembly_Section_Content {
    fn from(v: OptRc<Webassembly_TypeSection>) -> Self {
        Self::Webassembly_TypeSection(v)
    }
}
impl From<&Webassembly_Section_Content> for OptRc<Webassembly_StartSection> {
    fn from(v: &Webassembly_Section_Content) -> Self {
        if let Webassembly_Section_Content::Webassembly_StartSection(x) = v {
            return x.clone();
        }
        panic!(
            "expected Webassembly_Section_Content::Webassembly_StartSection, got {:?}",
            v
        )
    }
}
impl From<OptRc<Webassembly_StartSection>> for Webassembly_Section_Content {
    fn from(v: OptRc<Webassembly_StartSection>) -> Self {
        Self::Webassembly_StartSection(v)
    }
}
impl From<&Webassembly_Section_Content> for OptRc<Webassembly_DataSection> {
    fn from(v: &Webassembly_Section_Content) -> Self {
        if let Webassembly_Section_Content::Webassembly_DataSection(x) = v {
            return x.clone();
        }
        panic!(
            "expected Webassembly_Section_Content::Webassembly_DataSection, got {:?}",
            v
        )
    }
}
impl From<OptRc<Webassembly_DataSection>> for Webassembly_Section_Content {
    fn from(v: OptRc<Webassembly_DataSection>) -> Self {
        Self::Webassembly_DataSection(v)
    }
}
impl KStruct for Webassembly_Section {
    type Root = Webassembly;
    type Parent = Webassembly;

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
        *self_rc.id.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.len_content.borrow_mut() = t;
        match *self_rc.id() {
            Webassembly_SectionId::CodeSection => {
                *self_rc.content_raw.borrow_mut() = _io
                    .read_bytes(*self_rc.len_content().value()? as usize)?
                    .into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, Webassembly_CodeSection>(
                    &_t_content_raw_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            Webassembly_SectionId::CustomSection => {
                *self_rc.content_raw.borrow_mut() = _io
                    .read_bytes(*self_rc.len_content().value()? as usize)?
                    .into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, Webassembly_CustomSection>(
                    &_t_content_raw_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            Webassembly_SectionId::DataSection => {
                *self_rc.content_raw.borrow_mut() = _io
                    .read_bytes(*self_rc.len_content().value()? as usize)?
                    .into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, Webassembly_DataSection>(
                    &_t_content_raw_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            Webassembly_SectionId::ElementSection => {
                *self_rc.content_raw.borrow_mut() = _io
                    .read_bytes(*self_rc.len_content().value()? as usize)?
                    .into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, Webassembly_ElementSection>(
                    &_t_content_raw_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            Webassembly_SectionId::ExportSection => {
                *self_rc.content_raw.borrow_mut() = _io
                    .read_bytes(*self_rc.len_content().value()? as usize)?
                    .into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, Webassembly_ExportSection>(
                    &_t_content_raw_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            Webassembly_SectionId::FunctionSection => {
                *self_rc.content_raw.borrow_mut() = _io
                    .read_bytes(*self_rc.len_content().value()? as usize)?
                    .into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, Webassembly_FunctionSection>(
                    &_t_content_raw_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            Webassembly_SectionId::GlobalSection => {
                *self_rc.content_raw.borrow_mut() = _io
                    .read_bytes(*self_rc.len_content().value()? as usize)?
                    .into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, Webassembly_GlobalSection>(
                    &_t_content_raw_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            Webassembly_SectionId::ImportSection => {
                *self_rc.content_raw.borrow_mut() = _io
                    .read_bytes(*self_rc.len_content().value()? as usize)?
                    .into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, Webassembly_ImportSection>(
                    &_t_content_raw_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            Webassembly_SectionId::MemorySection => {
                *self_rc.content_raw.borrow_mut() = _io
                    .read_bytes(*self_rc.len_content().value()? as usize)?
                    .into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, Webassembly_MemorySection>(
                    &_t_content_raw_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            Webassembly_SectionId::StartSection => {
                *self_rc.content_raw.borrow_mut() = _io
                    .read_bytes(*self_rc.len_content().value()? as usize)?
                    .into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, Webassembly_StartSection>(
                    &_t_content_raw_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            Webassembly_SectionId::TableSection => {
                *self_rc.content_raw.borrow_mut() = _io
                    .read_bytes(*self_rc.len_content().value()? as usize)?
                    .into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, Webassembly_TableSection>(
                    &_t_content_raw_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            Webassembly_SectionId::TypeSection => {
                *self_rc.content_raw.borrow_mut() = _io
                    .read_bytes(*self_rc.len_content().value()? as usize)?
                    .into();
                let content_raw = self_rc.content_raw.borrow();
                let _t_content_raw_io = BytesReader::from(content_raw.clone());
                let t = Self::read_into::<BytesReader, Webassembly_TypeSection>(
                    &_t_content_raw_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.content.borrow_mut() = Some(
                    _io.read_bytes(*self_rc.len_content().value()? as usize)?
                        .into(),
                );
            }
        }
        Ok(())
    }
}
impl Webassembly_Section {}

/**
 * Section identifier
 */
impl Webassembly_Section {
    pub fn id(&self) -> Ref<'_, Webassembly_SectionId> {
        self.id.borrow()
    }
}

/**
 * Length of the section content in bytes
 */
impl Webassembly_Section {
    pub fn len_content(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.len_content.borrow()
    }
}

/**
 * Section content
 */
impl Webassembly_Section {
    pub fn content(&self) -> Ref<'_, Option<Webassembly_Section_Content>> {
        self.content.borrow()
    }
}
impl Webassembly_Section {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Webassembly_Section {
    pub fn content_raw(&self) -> Ref<'_, Vec<u8>> {
        self.content_raw.borrow()
    }
}

/**
 * (id 8) - Start-function or -component of the module
 * \sa https://www.w3.org/TR/wasm-core-1/#binary-startsec Source
 */

#[derive(Default, Debug, Clone)]
pub struct Webassembly_StartSection {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_Section>,
    pub _self: SharedType<Self>,
    start: RefCell<OptRc<VlqBase128Le>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_StartSection {
    type Root = Webassembly;
    type Parent = Webassembly_Section;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.start.borrow_mut() = t;
        Ok(())
    }
}
impl Webassembly_StartSection {}

/**
 * function index of the start-function
 */
impl Webassembly_StartSection {
    pub fn start(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.start.borrow()
    }
}
impl Webassembly_StartSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Webassembly_Table {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    elemtype: RefCell<Webassembly_Types>,
    limits: RefCell<OptRc<Webassembly_Limits>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_Table {
    type Root = Webassembly;
    type Parent = KStructUnit;

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
        *self_rc.elemtype.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        if !(*self_rc.elemtype() == Webassembly_Types::Element) {
            return Err(KError::ValidationFailed(ValidationFailedError {
                kind: ValidationKind::NotEqual,
                src_path: "/types/table/seq/0".to_string(),
            }));
        }
        let t = Self::read_into::<_, Webassembly_Limits>(&*_io, Some(self_rc._root.clone()), None)?
            .into();
        *self_rc.limits.borrow_mut() = t;
        Ok(())
    }
}
impl Webassembly_Table {}
impl Webassembly_Table {
    pub fn elemtype(&self) -> Ref<'_, Webassembly_Types> {
        self.elemtype.borrow()
    }
}
impl Webassembly_Table {
    pub fn limits(&self) -> Ref<'_, OptRc<Webassembly_Limits>> {
        self.limits.borrow()
    }
}
impl Webassembly_Table {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * (id 4) Vector of tables
 * \sa https://www.w3.org/TR/wasm-core-1/#binary-tablesec Source
 */

#[derive(Default, Debug, Clone)]
pub struct Webassembly_TableSection {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_Section>,
    pub _self: SharedType<Self>,
    num_tables: RefCell<OptRc<VlqBase128Le>>,
    tables: RefCell<Vec<OptRc<Webassembly_Table>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_TableSection {
    type Root = Webassembly;
    type Parent = Webassembly_Section;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.num_tables.borrow_mut() = t;
        *self_rc.tables.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Webassembly_Table>(
                    &*_io,
                    Some(self_rc._root.clone()),
                    None,
                )?
                .into();
                self_rc.tables.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Webassembly_TableSection {}
impl Webassembly_TableSection {
    pub fn num_tables(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.num_tables.borrow()
    }
}
impl Webassembly_TableSection {
    pub fn tables(&self) -> Ref<'_, Vec<OptRc<Webassembly_Table>>> {
        self.tables.borrow()
    }
}
impl Webassembly_TableSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * (id 1) - A vector of function types
 * \sa https://www.w3.org/TR/wasm-core-1/#binary-typesec Source
 */

#[derive(Default, Debug, Clone)]
pub struct Webassembly_TypeSection {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_Section>,
    pub _self: SharedType<Self>,
    num_functypes: RefCell<OptRc<VlqBase128Le>>,
    functypes: RefCell<Vec<OptRc<Webassembly_Functype>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_TypeSection {
    type Root = Webassembly;
    type Parent = Webassembly_Section;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.num_functypes.borrow_mut() = t;
        *self_rc.functypes.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Webassembly_Functype>(
                    &*_io,
                    Some(self_rc._root.clone()),
                    Some(self_rc._self.clone()),
                )?
                .into();
                self_rc.functypes.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Webassembly_TypeSection {}
impl Webassembly_TypeSection {
    pub fn num_functypes(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.num_functypes.borrow()
    }
}
impl Webassembly_TypeSection {
    pub fn functypes(&self) -> Ref<'_, Vec<OptRc<Webassembly_Functype>>> {
        self.functypes.borrow()
    }
}
impl Webassembly_TypeSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Webassembly_VecValtype {
    pub _root: SharedType<Webassembly>,
    pub _parent: SharedType<Webassembly_Functype>,
    pub _self: SharedType<Self>,
    num_types: RefCell<OptRc<VlqBase128Le>>,
    valtype: RefCell<Vec<Webassembly_ValTypes>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Webassembly_VecValtype {
    type Root = Webassembly;
    type Parent = Webassembly_Functype;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.num_types.borrow_mut() = t;
        *self_rc.valtype.borrow_mut() = Vec::new();
        let l_valtype = *self_rc.num_types().value()?;
        for _i in 0..l_valtype {
            self_rc
                .valtype
                .borrow_mut()
                .push((_io.read_u1()? as i64).try_into()?);
        }
        Ok(())
    }
}
impl Webassembly_VecValtype {}
impl Webassembly_VecValtype {
    pub fn num_types(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.num_types.borrow()
    }
}

/**
 * Value Types
 * \sa https://www.w3.org/TR/wasm-core-1/#binary-valtype Source
 */
impl Webassembly_VecValtype {
    pub fn valtype(&self) -> Ref<'_, Vec<Webassembly_ValTypes>> {
        self.valtype.borrow()
    }
}
impl Webassembly_VecValtype {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
