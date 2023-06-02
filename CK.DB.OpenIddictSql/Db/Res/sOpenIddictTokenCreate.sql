﻿-- SetupConfig: {}

create procedure CK.sOpenIddictTokenCreate
(
    @ActorId int,
    @ApplicationId uniqueidentifier,
    @AuthorizationId uniqueidentifier,
    @CreationDate datetime2(2),--todo: creationdate
    @ExpirationDate datetime2(2), -- todo: ExpirationDate
    @Payload nvarchar(max),
    @Properties nvarchar (max),
    @RedemptionDate datetime2 (2), -- todo: date
    @ReferenceId uniqueidentifier,
    @Status nvarchar (8),
    @Subject nvarchar (256),
    @Type nvarchar (22),
    @TokenIdResult uniqueidentifier output
)
as
begin
    if @ActorId <= 0 throw 50000, 'Security.AnonymousNotAllowed', 1;
    --[beginsp]

    select @TokenIdResult = NewId();

    --<PreCreate revert />

    insert into CK.tOpenIddictToken
    (
        TokenId,
        ApplicationId,
        AuthorizationId,
        CreationDate,
        ExpirationDate,
        Payload,
        Properties,
        RedemptionDate,
        ReferenceId,
        Status,
        Subject,
        Type
    )
    values
    (
        @TokenIdResult,
        @ApplicationId,
        @AuthorizationId,
        @CreationDate,
        @ExpirationDate,
        @Payload,
        @Properties,
        @RedemptionDate,
        @ReferenceId,
        @Status,
        @Subject,
        @Type
    )

    --<PostCreate />

    --[endsp]
end
