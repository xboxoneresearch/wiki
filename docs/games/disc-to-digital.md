# Disc to Digital (digitize)

## Overview

You can claim Xbox One and Xbox Series physical discs as digital
entitlements through the Disc to Digital (DTD) program. The claim
endpoint lives on the commerce/franchise service
`plaid.xboxservices.com`:

```
POST /XboxOneFD/disctodigital/digitize
```

The service validates the claim against data physically burned into
the disc at the pressing plant. This page documents the wire format
and the entitlement provenance chain observed on the wire.

## Request

```json
{
  "BcaData": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
  "MediaId": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
  "storeIds": [],
  "xboxProductIds": ["XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"]
}
```

- **BcaData**: authorization data read from the Burst Cutting Area
  (BCA), the plant-burned band of cuts at the disc's inner edge,
  unique per pressing. This is the anti-forgery anchor: the server
  does not grant without it, and it is bound to the pressed disc.
  64 raw bytes (88 base64 characters) on both discs observed so far.
- **MediaId**: per-disc media identifier (32 hex characters).
- **xboxProductIds**: candidate title identity taken from the disc
  metadata (package GUID).

## Response (success)

```json
{
  "status": 1,
  "bcaId": "3:0:NN:NN:NNNNN:NNNNNNN:NNNNNNNNNN",
  "entitlements": [
    {
      "productId": "XXXXXXXXXXXX",
      "skuId": "0001",
      "title": null,
      "isNewGrant": true
    }
  ],
  "message": null,
  "error": null
}
```

- **bcaId**: server-side structured decode of the disc BCA,
  colon-separated fields.
- The granted commerce `productId` differs from the request's package
  GUID. The server maps disc identity to the current storefront
  product.
- `isNewGrant: true` marks a first-time claim. Repeat claims return
  the existing entitlement instead.

## bcaId decode table

The bcaId is the first 16 bytes of BcaData. Both observed discs use
the same layout:

| offset | size | field | disc A | disc B | notes |
|---|---|---|---|---|---|
| 0 | 1 | 1 | 3 | 3 | same on both discs |
| 1 | 1 | 2 | 0 | 0 | same on both discs |
| 2 | 1 | 3 | NN | NN | differs per disc; consecutive values on discs pressed 2 years apart make a per-plant counter unlikely |
| 3 | 1 | 4 | N | N | differs per disc |
| 4 | 4 | 5 | NNNNN | NNNNN | little-endian u32 |
| 8 | 4 | 6 | NNNNNNN | NNNNNNN | little-endian u32, per-disc serial |
| 12 | 4 | 7 | NNNNNNNNNN | NNNNNNNNNN | little-endian u32 unix timestamp |

The timestamp decodes to the disc manufacturing date. Disc A decodes
to the release month of its title. Disc B decodes to a later pressing
of its title.

The remaining 48 bytes of BcaData are three 16-byte records. They do
not match the AACS Media ID record layout and appear encrypted or
authenticated. The MediaId field is not contained in BcaData.

## Follow-on flow after a successful claim

1. `POST /v7.0/collections/query` burst on
   `collections.mp.microsoft.com`. Inventory re-sync. The new
   entitlement appears in the account collection with purchaser
   identity and a satisfiedBy chain.
2. `GET /v7.0/products/lookup?fieldsTemplate=InstallAgent&...` on
   `displaycatalog.mp.microsoft.com` for install metadata of the
   granted productId.
3. titlehub titlerecord refresh.

## Entitlement provenance chain

The full chain is reconstructable from the wire alone:

1. digitize POST (BCA + MediaId + package GUID) grants a
   `productId` with `isNewGrant: true`.
2. The collections re-sync shows the granting entitlement. Its
   `itemId` has the form
   `xbx:XXXXXXXXXXXXXXXX;XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX;XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX` and
   embeds the claiming console identity and the disc identity.
   A pre-existing disc-era entitlement with the same productId is
   mapped/upgraded by the claim, not replaced.
3. The playable grant is a separate productId that points back at
   the disc claim through `satisfiedByProductId`, with
   `isSatisfiedItem: true` and status Active.

Chain: BCA blob -> server bcaId -> granting productId (itemId carries
console + disc identity) -> satisfiedBy chain to the store product.

## Research implications

- The service validates the claim server-side against the disc BCA. A network
  observer can watch and replay a real exchange, but BcaData gates
  minted claims: an observer cannot mint claims for discs it does not
  physically possess.
- The digitize endpoint is the only DTD surface on the wire. The
  console also fetches help-article content during the claim
  (`plaid /xboxonefd/content/...`). Those requests returned 404 and
  have no role in the claim.
- The claim needs no special network setup. An on-path listener can
  see the exchange but is not required.

## Related pages

- [Xbox Game Disc](xbox-game-disc.md) - disc structure and
  License0.xml
- [JWT Token Relying Parties](../xbox-live/jwt-token-relyingparties.md)
  - `collections.mp.microsoft.com` shares the
  `http://licensing.xboxlive.com` relying party
