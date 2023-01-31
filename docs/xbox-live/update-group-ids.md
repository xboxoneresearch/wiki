# Xbox Live Update Group IDs

## What are Update Groups?
Game Devkits are able to switch between the top three update groups listed below, allowing for targeting no updates, the latest GA (General Availabity) build, or the latest SA (Skip Ahead) build. There are a number of internal update IDs used for Dogfooding, Canary, and other purposes, but are of no use to the common person as Microsoft enforces an allowlist based on console ID.


## Update IDs
| Name                       | Update ID                            | Description                                            |
|----------------------------|--------------------------------------|--------------------------------------------------------|
| NO_UPDATE_GROUP_ID         | b2dbed33-2845-44cc-a7a1-4a9afb29d8d9 | No forced or offered updates. Useful when downgrading. |
| LATEST_PRODUCTION_GROUP_ID | 7432ae99-8c09-48dd-99f9-a2697499e240 | Latest GA build.                                       |
| LATEST_PREVIEW_GROUP_ID    | a8153054-1a1b-47cc-acc9-9aed90c1f8db | Latest Skip Ahead build.                               |
| PublicInsider0             | 71860d74-c3f8-43e8-be56-564cb365ca94 | Xbox One Update Preview Alpha                          |
| PublicInsider10            | c661a50c-e675-4ff3-a76a-2a6750a4a24b | Xbox One Update Preview Alpha Skip Ahead               |
| Canary0                    | 1c22935f-ff5a-4a50-803b-8c026fe40af8 | Current Canary builds. Team Xbox employees only, nightly builds.              |
| Canary1                    | d8e8c84c-3161-4e75-8243-2420d2224599 | Skip Ahead Canary builds of the next milestone. Team Xbox employees only, nightly builds.              |
| Canary2                    | 3bfd33ac-59a5-443f-a800-75fe6e7f8190 | Skip Ahead Canary builds of the current milestone. Team Xbox employees only, nightly builds.              |
| TakehomeInsider0           | 19fb59b8-2784-402d-9156-6926f7b11371 | Team Xbox employees only.                              |
| SelfhostInsider0           | 34522eb7-9834-4955-bc94-db6054e80019 | Open to any MS employees.                              |