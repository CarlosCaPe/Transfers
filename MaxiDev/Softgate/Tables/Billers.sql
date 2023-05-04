﻿CREATE TABLE [Softgate].[Billers] (
    [IdTBillers]                        INT            NOT NULL,
    [TerminalNumber]                    INT            NULL,
    [VendorID]                          VARCHAR (MAX)  NULL,
    [VendorType]                        VARCHAR (MAX)  NULL,
    [VendorSubType]                     VARCHAR (MAX)  NULL,
    [VendorPostType]                    VARCHAR (MAX)  NULL,
    [VendorRemitCountry]                VARCHAR (MAX)  NULL,
    [VendorName]                        VARCHAR (MAX)  NULL,
    [VendorMasterName]                  VARCHAR (MAX)  NULL,
    [VendorDetailDesc]                  VARCHAR (MAX)  NULL,
    [EntryMaskFlag]                     VARCHAR (MAX)  NULL,
    [VendorAccountLengthMin]            SMALLINT       NULL,
    [VendorAccountLengthMax]            SMALLINT       NULL,
    [VendorTranAmtMin]                  MONEY          NULL,
    [VendorTranAmtMax]                  MONEY          NULL,
    [DuplicateEntryFlag]                BIT            NULL,
    [CustFee]                           MONEY          NULL,
    [CustMinFee]                        MONEY          NULL,
    [CustMaxFee]                        MONEY          NULL,
    [IPPFeeShare]                       MONEY          NULL,
    [CustNameRequired]                  BIT            NULL,
    [SenderNameRequired]                BIT            NULL,
    [SenderRequiredAmtMin]              MONEY          NULL,
    [MaskAcctOnReceipt]                 BIT            NULL,
    [VendorFavoriteSeq]                 SMALLINT       NULL,
    [PostingTimeDesc]                   VARCHAR (MAX)  NULL,
    [PostingTimeCutoff]                 VARCHAR (MAX)  NULL,
    [VendorRemitTiming]                 VARCHAR (MAX)  NULL,
    [VendorDeployType]                  NVARCHAR (MAX) NULL,
    [ScanImageFlag]                     NVARCHAR (MAX) NULL,
    [ScanDataFlag]                      NVARCHAR (MAX) NULL,
    [ScanDetails_Id]                    INT            NULL,
    [ScanDetails_CoordFieldType]        NVARCHAR (MAX) NULL,
    [ScanDetails_Coordinates]           NVARCHAR (MAX) NULL,
    [ScanDetails_OcrType]               NVARCHAR (MAX) NULL,
    [ScanLineFlag]                      NVARCHAR (MAX) NULL,
    [SplitTenderFlag]                   NVARCHAR (MAX) NULL,
    [SplitTenderDetails_AccChecksType]  BIT            NULL,
    [SplitTenderDetails_MultiAcccounts] BIT            NULL,
    [PresentmentFlag]                   BIT            NULL,
    [FormFlag]                          BIT            NULL,
    [FormDetails_AcctNumOptional]       BIT            NULL,
    [FormDetails_AltLookupLabel]        NVARCHAR (MAX) NULL,
    [FormDetails_AltLookupVisibleLen]   INT            NULL,
    [FormDetails_AltLookupMaxLen]       INT            NULL,
    [FormDetails_AddInfoLabel1]         NVARCHAR (MAX) NULL,
    [FormDetails_AddInfoReqFlag1]       BIT            NULL,
    [FormDetails_AddInfoValType1]       NVARCHAR (MAX) NULL,
    [FormDetails_AddInfoVisibleLen1]    INT            NULL,
    [FormDetails_AddInfoMaxLen1]        INT            NULL,
    [FormDetails_AddInfoLabel2]         NVARCHAR (MAX) NULL,
    [FormDetails_AddInfoReqFlag2]       BIT            NULL,
    [FormDetails_AddInfoValType2]       NVARCHAR (MAX) NULL,
    [FormDetails_AddInfoVisibleLen2]    INT            NULL,
    [FormDetails_AddInfoMaxLen2]        INT            NULL,
    [FormDetails_DispOnlyLabel1]        NVARCHAR (MAX) NULL,
    [FormDetails_DispOnlyLen1]          NVARCHAR (MAX) NULL,
    [FormDetails_DispOnlyLabel2]        NVARCHAR (MAX) NULL,
    [FormDetails_DispOnlyLen2]          NVARCHAR (MAX) NULL,
    [FormDetails_PrevBalDispFlag]       NVARCHAR (MAX) NULL,
    [FormDetails_PrevPaidDispFlag]      NVARCHAR (MAX) NULL,
    [FormDetails_LatestBillDispFlag]    NVARCHAR (MAX) NULL,
    [FormDetails_BalDueDispFlag]        NVARCHAR (MAX) NULL,
    [FormDetails_DueDateDispFlag]       NVARCHAR (MAX) NULL,
    [BillerHelpFlag]                    BIT            NULL,
    [BillerHelpInfo_HelpTextEnglish]    NVARCHAR (MAX) NULL,
    [BillerHelpInfo_HelpTextSpanish]    NVARCHAR (MAX) NULL,
    [BillerHelpInfo_HelpURL]            NVARCHAR (MAX) NULL,
    [VendorFeeClass]                    VARCHAR (MAX)  NULL
);
