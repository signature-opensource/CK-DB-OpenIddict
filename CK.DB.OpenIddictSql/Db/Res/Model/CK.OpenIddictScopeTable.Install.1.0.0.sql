create table CK.tOpenIddictScope
(
    ScopeId      uniqueidentifier not null,
    Description  nvarchar(1024) collate LATIN1_GENERAL_100_BIN2,
    Descriptions nvarchar(max) collate LATIN1_GENERAL_100_BIN2,
    DisplayName  nvarchar(255) collate LATIN1_GENERAL_100_CI_AS,
    DisplayNames nvarchar(max) collate LATIN1_GENERAL_100_CI_AS,
    ScopeName    nvarchar(255) collate LATIN1_GENERAL_100_CS_AS not null,
    Properties   nvarchar(max) collate LATIN1_GENERAL_100_BIN2, -- determine size
    Resources    nvarchar(max) collate LATIN1_GENERAL_100_BIN2, -- determine size,

    constraint PK_OpenIddictScope primary key (ScopeId)
);

create unique index IX_OpenIddictScope_ScopeName on CK.tOpenIddictScope (ScopeName);

