# MicrosoftXboxSecurityClip.exe

`C:\Windows\System32\MicrosoftXboxSecurityClip.exe` is a system service which handles the loading, parsing, 
validation, and serialization of `license.xml` files/data.

---

## Classes (COM)

- ClipService: `{7E480B22-B679-4542-9B30-D5A52DA92CE5}`

### ILicenseManager

- ILicenseManager: `{2769C3A8-D8E3-41BA-B38B-01D05DD2374E}`

TBD

```cpp
struct /*VFT*/ ClipServiceComObject_vtbl
{
  HRESULT (__fastcall *ClipServiceComObject__QueryInterface)(ClipServiceComObject *self, const IID *requestedIid, void **outInterface);
  ULONG (__fastcall *AddRef)(ComBaseObject *self);
  __int64 (__fastcall *sub_140004720)(volatile signed __int32 *);
  HRESULT (__fastcall *ClipServiceCom__StoreLicense)(ClipServiceComObject *self, const wchar_t *licenseBuffer, unsigned int operationFlags, IUnknown **outLicenseInterface);
  __int64 (__fastcall *sub_1400041B0)(__int64, __int64);
  __int64 (*ClipServiceCom__QueryOnLicenseId)(__int64, __int64, int, ...);
  __int64 (*ClipServiceCom__QueryOnKeyId)(__int64, __int64, int, ...);
  __int64 (*sub_1400043E0)(__int64, __int64, int, ...);
  __int64 (__fastcall *ClipServiceCom__LoadLicense)(ClipServiceComObject *ClipServiceComObject, __int64 a2);
  __int64 (__fastcall *sub_1400048A0)(__int64, __int64);
  __int64 (__fastcall *sub_1400049D0)(__int64, _DWORD *);
  void *(__fastcall *sub_140003D30)(void *, char);
};
```

### ILicenseObject

- ILicenseObject: `{94EA2B94-E9CC-49E0-C0FF-EE64CA8F5B90}`

TBD

```cpp
struct /*VFT*/ LicenseObject_vtbl
{
  HRESULT (__fastcall *LicenseObject__QueryInterface)(LicenseObject *self, const IID *riid, void **outInterface);
  ULONG (__fastcall *AddRef)(ComBaseObject *self);
  ULONG (__fastcall *LicenseObject__Release)(LicenseObject *self);
  __int64 (__fastcall *LicenseObject__GetKeyId)(LicenseObject *self, BSTR *a2);
  __int64 (__fastcall *LicenseObject__GetLicenseId)(LicenseObject *self, __int64 a2);
  __int64 (__fastcall *LicenseObject__GetExpirationDate)(LicenseObject *self, _QWORD *a2);
  __int64 (__fastcall *LicenseObject__GetBeginDate)(LicenseObject *self, _QWORD *a2);
  __int64 (__fastcall *LicenseObject__GetIssueDate)(LicenseObject *self, _QWORD *a2);
  __int64 (__fastcall *LicenseObject__GetRootKeyId)(LicenseObject *self, BSTR *a2);
  __int64 (__fastcall *sub_1400134D0)(LicenseObject *self, BSTR *a2);
  __int64 (__fastcall *sub_140013230)(LicenseObject *self, BSTR *a2);
  __int64 (__fastcall *LicenseObject__GetFlags)(LicenseObject *self, LicenseFlags *a2);
  __int64 (__fastcall *LicenseObject__GetPolicy)(LicenseObject *self, BSTR *a2);
  __int64 (__fastcall *LicenseObject__GetDiscId)(LicenseObject *self, BSTR *a2);
  LicenseObject *(__fastcall *LicenseObject__Destructor)(LicenseObject *self, char a2);
};
```