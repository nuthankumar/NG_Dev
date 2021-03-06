USE [SFCRM]
GO
/****** Object:  StoredProcedure [dbo].[DropCreatePoints]    Script Date: 04/20/2018 17:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DropCreatePoints]
	-- Add the parameters for the stored procedure here


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblTransactionPoints]') AND type in (N'U'))
DROP TABLE [dbo].[tblTransactionPoints]

SET ANSI_NULLS ON


SET QUOTED_IDENTIFIER ON


CREATE TABLE [dbo].[tblTransactionPoints](
	[TransAutoId] [int] IDENTITY(1,1) NOT NULL,
	[ContestID] [int] NOT NULL,
	[ContestName] [nvarchar](100) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[AgentNo] [int] NOT NULL,
	[LoadDate] [int] NULL,
	[NetPoints] [int] NULL,
	[NetPayable] [int] NULL,
	[NetPaid] [int] NULL,
	[PreviousPaid] [int] NULL,
	[BalancePayable] [int] NULL,
	[PreviousNetPayable] [int] NULL,
	[ValidFlag] [smallint] NOT NULL,
	[PaymentFlag] [smallint] NOT NULL,
	[EntryFlag] [int] NOT NULL,
	[RecordCreateDate] [int] NOT NULL,
	[PRFNum] [nvarchar](100) NULL,
	[SelectRecrd] [bit] NULL,
	[Status] [int] NULL,
	[Remarks] [nvarchar](100) NULL,
    [AGTYPES] [varchar](50) NULL,
	[Maker1UID] [nvarchar](50) NULL,
	[MakerName] [nvarchar](100) NULL,
	[Makerdate] [int] NULL,
	[MakerTime] [datetime] NULL,
	[CheckerUID] [nvarchar](50) NULL,
	[CheckerName] [nvarchar](100) NULL,
	[Checkerdate] [int] NULL,
	[CheckerTime] [datetime] NULL,
	[DeviationApprUID] [nvarchar](50) NULL,
	[DeviationApprName] [nvarchar](100) NULL,
	[DeviationApprdate] [int] NULL,
	[DeviationApprTime] [datetime] NULL,
	[DeviationApprRemarks] [nvarchar](200) NULL,
	[Approver1UID] [nvarchar](50) NULL,
	[Approver1Name] [nvarchar](100) NULL,
	[Approver1date] [int] NULL,
	[Approver1Time] [datetime] NULL,
	[Approver1Remarks] [nvarchar](200) NULL,
	[Approver2UID] [nvarchar](50) NULL,
	[Approver2Name] [nvarchar](100) NULL,
	[Approver2date] [int] NULL,
	[Approver2Time] [datetime] NULL,
	[Approver2Remarks] [nvarchar](200) NULL,
	[Approver3UID] [nvarchar](50) NULL,
	[Approver3Name] [nvarchar](100) NULL,
	[Approver3date] [int] NULL,
	[Approver3Time] [datetime] NULL,
	[Approver3Remarks] [nvarchar](200) NULL,
	[Paymentdate] [int] NULL,
	[PaymentTime] [datetime] NULL,
	[PRFAmount] [Float] NULL,
	[PRFNoGenREF] [int] NULL,
	[PRFNo] [nvarchar](100) NULL,
	[PRFGENDate] [int] NULL,
	[PRFComment] [nvarchar](300) NULL,
	[ConfirmationEMailAttchFilePath] [nvarchar](300)  NULL,
	[ConfirmationEMailAttchBy] [nvarchar](100)  NULL,
	[ConfirmationEMailAttchTime] [datetime] NULL,
	[CycleCount] [int] NULL
) ON [PRIMARY]



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=NEW PIPELINE RECORD;2=OLD PIPELINE RECORD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblTransactionPoints', @level2type=N'COLUMN',@level2name=N'ValidFlag'


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=NOT RECEIVED FROM FINANCE;2=RECEIVED FROM FINANCE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblTransactionPoints', @level2type=N'COLUMN',@level2name=N'PaymentFlag'


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=DEVIATION;2=CALIDUS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblTransactionPoints', @level2type=N'COLUMN',@level2name=N'EntryFlag'




END
GO
/****** Object:  StoredProcedure [dbo].[DropandCreateTickets]    Script Date: 04/20/2018 17:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
CREATE PROCEDURE [dbo].[DropandCreateTickets]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblTransactionTickets_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblTransactionTickets] DROP CONSTRAINT [DF_tblTransactionTickets_Status]
END

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblTransactionTickets]') AND type in (N'U'))
DROP TABLE [dbo].[tblTransactionTickets]

SET ANSI_NULLS ON


SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[tblTransactionTickets](
	[TransAutoId] [int] IDENTITY(1,1) NOT NULL,
	[ContestID] [int] NOT NULL,
	[ContestName] [nvarchar](100) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[AgentNo] [int] NOT NULL,
	[LoadDate] [int] NULL,
	[Createddate] [int] NULL,
	[TicketLists] [int] NOT NULL,
	[NetValue] [float] NULL,
	[NetPayable] [float] NULL,
	[NetPaid] [float] NULL,
	[PreviousPaid] [float] NULL,
	[BalancePayable] [float] NULL,
	[PreviousNetPayable] [float] NULL,
	[Option] [nvarchar](20) NULL,
	[DestID] [int] NULL,
	[RuleName] [nvarchar](255) NULL,
	[Seq] [nvarchar](255) NULL,
	[ValidFlag] [smallint] NOT NULL,
	[PaymentFlag] [smallint] NOT NULL,
	[EntryFlag] [int] NOT NULL,
	[RecordCreateDate] [int] NULL,
	[SelectRecrd] [bit] NULL,
	[Status] [int] NULL,
	[Remarks] [nvarchar](200) NULL,
	[AGTYPES] [varchar](50) NULL,
	[Maker1UID] [nvarchar](50) NULL,
	[MakerName] [nvarchar](100) NULL,
	[Makerdate] [int] NULL,
	[MakerTime] [datetime] NULL,
	[CheckerUID] [nvarchar](50) NULL,
	[CheckerName] [nvarchar](100) NULL,
	[Checkerdate] [int] NULL,
	[CheckerTime] [datetime] NULL,
	[DeviationApprUID] [nvarchar](50) NULL,
	[DeviationApprName] [nvarchar](100) NULL,
	[DeviationApprdate] [int] NULL,
	[DeviationApprTime] [datetime] NULL,
	[DeviationApprRemarks] [nvarchar](200) NULL,
	[Approver1UID] [nvarchar](50) NULL,
	[Approver1Name] [nvarchar](100) NULL,
	[Approver1date] [int] NULL,
	[Approver1Time] [datetime] NULL,
	[Approver1Remarks] [nvarchar](200) NULL,
	[Approver2UID] [nvarchar](50) NULL,
	[Approver2Name] [nvarchar](100) NULL,
	[Approver2date] [int] NULL,
	[Approver2Time] [datetime] NULL,
	[Approver2Remarks] [nvarchar](200) NULL,
	[Approver3UID] [nvarchar](50) NULL,
	[Approver3Name] [nvarchar](100) NULL,
	[Approver3date] [int] NULL,
	[Approver3Time] [datetime] NULL,
	[Approver3Remarks] [nvarchar](200) NULL,
	[Paymentdate] [int] NULL,
	[PaymentTime] [datetime] NULL,
	[PRFAmount] [float] NULL,
	[PRFNoGenREF] [int] NULL,
	[PRFNo] [nvarchar](100) NULL,
	[PRFGENDate] [int] NULL,
	[PRFComment] [nvarchar](300) NULL,
	[ConfirmationEMailAttchFilePath] [nvarchar](300) NULL,
	[ConfirmationEMailAttchBy] [nvarchar](100) NULL,
	[ConfirmationEMailAttchTime] [datetime] NULL,
	[CycleCount] [int] NULL,
	[CurrTicketsCount] [int] NULL,
	[PriTicketsCount] [int] NULL
) ON [PRIMARY]

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=NEW PIPELINE RECORD;2=OLD PIPELINE RECORD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblTransactionTickets', @level2type=N'COLUMN',@level2name=N'ValidFlag'


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=NOT RECEIVED FROM FINANCE;2=RECEIVED FROM FINANCE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblTransactionTickets', @level2type=N'COLUMN',@level2name=N'PaymentFlag'


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=DEVIATION;2=CALIDUS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblTransactionTickets', @level2type=N'COLUMN',@level2name=N'EntryFlag'


ALTER TABLE [dbo].[tblTransactionTickets] ADD  CONSTRAINT [DF_tblTransactionTickets_Status]  DEFAULT ((0)) FOR [Status]


END
GO
/****** Object:  StoredProcedure [dbo].[DropandCreateCash]    Script Date: 04/20/2018 17:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DropandCreateCash]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_tblTransactionCash_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblTransactionCash] DROP CONSTRAINT [DF_tblTransactionCash_Status]
END

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblTransactionCash]') AND type in (N'U'))
DROP TABLE [dbo].[tblTransactionCash]

SET ANSI_NULLS ON


SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[tblTransactionCash](
	[TransAutoId] [int] IDENTITY(1,1) NOT NULL,
	[ContestID] [int] NOT NULL,
	[ContestName] [nvarchar](100) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[AgentNo] [int] NOT NULL,
	[LoadDate] [int] NULL,
	[NetAmount] [int] NULL,
	[NetPayable] [int] NULL,
	[NetPaid] [int] NULL,
	[PreviousPaid] [int] NULL,
	[BalancePayable] [int] NULL,
	[PreviousNetPayable] [int] NULL,
	[ValidFlag] [smallint] NOT NULL,
	[PaymentFlag] [smallint] NOT NULL,
	[EntryFlag] [int] NOT NULL,
	[RecordCreateDate] [int] NOT NULL,
	[PRFNum] [nvarchar](100) NULL,
	[SelectRecrd] [bit] NULL,
	[Status] [int] NULL,
	[Remarks] [nvarchar](200) NULL,
	[AGTYPES] [varchar](50) NULL,
	[Maker1UID] [nvarchar](50) NULL,
	[MakerName] [nvarchar](100) NULL,
	[Makerdate] [int] NULL,
	[MakerTime] [datetime] NULL,
	[CheckerUID] [nvarchar](50) NULL,
	[CheckerName] [nvarchar](100) NULL,
	[Checkerdate] [int] NULL,
	[CheckerTime] [datetime] NULL,
	[DeviationApprUID] [nvarchar](50) NULL,
	[DeviationApprName] [nvarchar](100) NULL,
	[DeviationApprdate] [int] NULL,
	[DeviationApprTime] [datetime] NULL,
	[DeviationApprRemarks] [nvarchar](200) NULL,
	[Approver1UID] [nvarchar](50) NULL,
	[Approver1Name] [nvarchar](100) NULL,
	[Approver1date] [int] NULL,
	[Approver1Time] [datetime] NULL,
	[Approver1Remarks] [nvarchar](200) NULL,
	[Approver2UID] [nvarchar](50) NULL,
	[Approver2Name] [nvarchar](100) NULL,
	[Approver2date] [int] NULL,
	[Approver2Time] [datetime] NULL,
	[Approver2Remarks] [nvarchar](200) NULL,
	[Approver3UID] [nvarchar](50) NULL,
	[Approver3Name] [nvarchar](100) NULL,
	[Approver3date] [int] NULL,
	[Approver3Time] [datetime] NULL,
	[Approver3Remarks] [nvarchar](200) NULL,
	[Paymentdate] [int] NULL,
	[PaymentTime] [datetime] NULL,
	[PRFAmount] [Float] NULL,
	[PRFNoGenREF] [int] NULL,
	[PRFNo] [nvarchar](100) NULL,
	[PRFGENDate] [int] NULL,
	[PRFComment] [nvarchar](300) NULL,
	[ConfirmationEMailAttchFilePath] [nvarchar](300)  NULL,
	[ConfirmationEMailAttchBy] [nvarchar](100)  NULL,
	[ConfirmationEMailAttchTime] [datetime] NULL,
	[CycleCount] [int] NULL
	
) ON [PRIMARY]


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=NEW PIPELINE RECORD;2=OLD PIPELINE RECORD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblTransactionCash', @level2type=N'COLUMN',@level2name=N'ValidFlag'


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=NOT RECEIVED FROM FINANCE;2=RECEIVED FROM FINANCE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblTransactionCash', @level2type=N'COLUMN',@level2name=N'PaymentFlag'


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=DEVIATION;2=CALIDUS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblTransactionCash', @level2type=N'COLUMN',@level2name=N'EntryFlag'


ALTER TABLE [dbo].[tblTransactionCash] ADD  CONSTRAINT [DF_tblTransactionCash_Status]  DEFAULT ((0)) FOR [Status]


END
GO
/****** Object:  Table [dbo].[ExideContest]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExideContest](
	[ContestID] [decimal](20, 0) NULL,
	[Contest Name] [varchar](50) NULL,
	[Period] [varchar](10) NULL,
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[Type] [varchar](200) NULL,
	[1] [varchar](10) NULL,
	[2] [varchar](10) NULL,
	[3] [varchar](10) NULL,
	[4] [varchar](10) NULL,
	[5] [varchar](10) NULL,
	[6] [varchar](10) NULL,
	[7] [varchar](10) NULL,
	[8] [varchar](10) NULL,
	[9] [varchar](10) NULL,
	[10] [varchar](10) NULL,
	[11] [varchar](10) NULL,
	[12] [varchar](10) NULL,
	[13] [varchar](10) NULL,
	[14] [varchar](10) NULL,
	[15] [varchar](10) NULL,
	[16] [varchar](10) NULL,
	[17] [varchar](10) NULL,
	[18] [varchar](10) NULL,
	[19] [varchar](10) NULL,
	[20] [varchar](10) NULL,
	[21] [varchar](10) NULL,
	[22] [varchar](10) NULL,
	[23] [varchar](10) NULL,
	[24] [varchar](10) NULL,
	[25] [varchar](10) NULL,
	[26] [varchar](10) NULL,
	[27] [varchar](10) NULL,
	[28] [varchar](10) NULL,
	[29] [varchar](10) NULL,
	[30] [varchar](10) NULL,
	[Valid Flag] [varchar](5) NULL,
	[Report_Show] [varchar](5) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExideReportDataUpdate]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExideReportDataUpdate](
	[ContestID] [decimal](20, 0) NULL,
	[ContestName] [varchar](255) NULL,
	[Agent No] [varchar](255) NULL,
	[DOJ] [varchar](255) NULL,
	[DOT] [varchar](255) NULL,
	[Period] [varchar](10) NULL,
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[AgType] [varchar](10) NULL,
	[1] [varchar](10) NULL,
	[2] [varchar](10) NULL,
	[3] [varchar](10) NULL,
	[4] [varchar](10) NULL,
	[5] [varchar](10) NULL,
	[6] [varchar](10) NULL,
	[7] [varchar](10) NULL,
	[8] [varchar](10) NULL,
	[9] [varchar](10) NULL,
	[10] [varchar](10) NULL,
	[11] [varchar](10) NULL,
	[12] [varchar](10) NULL,
	[13] [varchar](10) NULL,
	[14] [varchar](10) NULL,
	[15] [varchar](10) NULL,
	[16] [varchar](10) NULL,
	[17] [varchar](10) NULL,
	[18] [varchar](10) NULL,
	[19] [varchar](10) NULL,
	[20] [varchar](10) NULL,
	[21] [varchar](10) NULL,
	[22] [varchar](10) NULL,
	[23] [varchar](10) NULL,
	[24] [varchar](10) NULL,
	[25] [varchar](10) NULL,
	[26] [varchar](10) NULL,
	[27] [varchar](10) NULL,
	[28] [varchar](10) NULL,
	[29] [varchar](10) NULL,
	[30] [varchar](10) NULL,
	[31] [varchar](10) NULL,
	[32] [varchar](10) NULL,
	[33] [varchar](10) NULL,
	[34] [varchar](10) NULL,
	[35] [varchar](10) NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExideRuleEngine]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExideRuleEngine](
	[Criteria] [varchar](50) NULL,
	[Period] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Seq] [varchar](50) NULL,
	[Rule Name] [varchar](400) NULL,
	[1] [varchar](10) NULL,
	[2] [varchar](10) NULL,
	[3] [varchar](10) NULL,
	[4] [varchar](10) NULL,
	[5] [varchar](10) NULL,
	[Payable] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblAgType]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAgType](
	[TransAutoId] [int] IDENTITY(1,1) NOT NULL,
	[Agtypes] [nvarchar](255) NULL,
	[AgID] [int] NULL,
	[CostCentreCode] [nvarchar](255) NULL,
	[Channel] [nvarchar](255) NULL,
	[LocationBranchCode] [nvarchar](255) NULL,
	[ModeOfPayment] [nvarchar](255) NULL,
	[BlackListed] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAgentTypeMaster]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAgentTypeMaster](
	[AgntTypeId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[AgentTypeName] [varchar](50) NOT NULL,
	[Description] [varchar](250) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblAgentTypeMaster] PRIMARY KEY CLUSTERED 
(
	[AgntTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblAgentMaster19July]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAgentMaster19July](
	[TransAutoId] [int] NOT NULL,
	[AgentNo] [nvarchar](255) NULL,
	[AgentName] [nvarchar](255) NULL,
	[AGTYPE] [nvarchar](255) NULL,
	[IRDNO] [nvarchar](255) NULL,
	[DtApp] [datetime] NULL,
	[DtTerm] [datetime] NULL,
	[BranchCode] [nvarchar](20) NULL,
	[BankACNumber] [nvarchar](255) NULL,
	[IFSCCode] [nvarchar](255) NULL,
	[Load_Date] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAgentMaster_JUNE1]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAgentMaster_JUNE1](
	[TransAutoId] [int] NOT NULL,
	[AgentNo] [nvarchar](255) NULL,
	[AgentName] [nvarchar](255) NULL,
	[AGTYPE] [nvarchar](255) NULL,
	[IRDNO] [nvarchar](255) NULL,
	[DtApp] [datetime] NULL,
	[DtTerm] [datetime] NULL,
	[BranchCode] [nvarchar](20) NULL,
	[BankACNumber] [nvarchar](255) NULL,
	[IFSCCode] [nvarchar](255) NULL,
	[Load_Date] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAgentMaster_DF3705]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAgentMaster_DF3705](
	[TransAutoId] [int] NOT NULL,
	[AgentNo] [nvarchar](255) NULL,
	[AgentName] [nvarchar](255) NULL,
	[AGTYPE] [nvarchar](255) NULL,
	[IRDNO] [nvarchar](255) NULL,
	[DtApp] [datetime] NULL,
	[DtTerm] [datetime] NULL,
	[BranchCode] [nvarchar](20) NULL,
	[BankACNumber] [nvarchar](255) NULL,
	[IFSCCode] [nvarchar](255) NULL,
	[Load_Date] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAgentMaster_DF_3687]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAgentMaster_DF_3687](
	[TransAutoId] [int] NOT NULL,
	[AgentNo] [nvarchar](255) NULL,
	[AgentName] [nvarchar](255) NULL,
	[AGTYPE] [nvarchar](255) NULL,
	[IRDNO] [nvarchar](255) NULL,
	[DtApp] [datetime] NULL,
	[DtTerm] [datetime] NULL,
	[BranchCode] [nvarchar](20) NULL,
	[BankACNumber] [nvarchar](255) NULL,
	[IFSCCode] [nvarchar](255) NULL,
	[Load_Date] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAgentMaster_CCD3740]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAgentMaster_CCD3740](
	[TransAutoId] [int] NOT NULL,
	[AgentNo] [nvarchar](255) NULL,
	[AgentName] [nvarchar](255) NULL,
	[AGTYPE] [nvarchar](255) NULL,
	[IRDNO] [nvarchar](255) NULL,
	[DtApp] [datetime] NULL,
	[DtTerm] [datetime] NULL,
	[BranchCode] [nvarchar](20) NULL,
	[BankACNumber] [nvarchar](255) NULL,
	[IFSCCode] [nvarchar](255) NULL,
	[Load_Date] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAgentMaster_bkp27]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAgentMaster_bkp27](
	[TransAutoId] [int] NOT NULL,
	[AgentNo] [nvarchar](255) NULL,
	[AgentName] [nvarchar](255) NULL,
	[AGTYPE] [nvarchar](255) NULL,
	[IRDNO] [nvarchar](255) NULL,
	[DtApp] [datetime] NULL,
	[DtTerm] [datetime] NULL,
	[BranchCode] [nvarchar](20) NULL,
	[BankACNumber] [nvarchar](255) NULL,
	[IFSCCode] [nvarchar](255) NULL,
	[Load_Date] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAgentMaster_bkp_8june]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAgentMaster_bkp_8june](
	[TransAutoId] [int] NOT NULL,
	[AgentNo] [nvarchar](255) NULL,
	[AgentName] [nvarchar](255) NULL,
	[AGTYPE] [nvarchar](255) NULL,
	[IRDNO] [nvarchar](255) NULL,
	[DtApp] [datetime] NULL,
	[DtTerm] [datetime] NULL,
	[BranchCode] [nvarchar](20) NULL,
	[BankACNumber] [nvarchar](255) NULL,
	[IFSCCode] [nvarchar](255) NULL,
	[Load_Date] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAgentMaster_26092016]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAgentMaster_26092016](
	[TransAutoId] [int] NOT NULL,
	[AgentNo] [nvarchar](255) NULL,
	[AgentName] [nvarchar](255) NULL,
	[AGTYPE] [nvarchar](255) NULL,
	[IRDNO] [nvarchar](255) NULL,
	[DtApp] [datetime] NULL,
	[DtTerm] [datetime] NULL,
	[BranchCode] [nvarchar](20) NULL,
	[BankACNumber] [nvarchar](255) NULL,
	[IFSCCode] [nvarchar](255) NULL,
	[Load_Date] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAgentMaster_20JUNE16]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAgentMaster_20JUNE16](
	[TransAutoId] [int] NOT NULL,
	[AgentNo] [nvarchar](255) NULL,
	[AgentName] [nvarchar](255) NULL,
	[AGTYPE] [nvarchar](255) NULL,
	[IRDNO] [nvarchar](255) NULL,
	[DtApp] [datetime] NULL,
	[DtTerm] [datetime] NULL,
	[BranchCode] [nvarchar](20) NULL,
	[BankACNumber] [nvarchar](255) NULL,
	[IFSCCode] [nvarchar](255) NULL,
	[Load_Date] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAgentMaster]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAgentMaster](
	[AgentNo] [nvarchar](255) NULL,
	[AgentName] [nvarchar](255) NULL,
	[AGTYPE] [nvarchar](255) NULL,
	[IRDNO] [nvarchar](255) NULL,
	[DtApp] [datetime] NULL,
	[DtTerm] [datetime] NULL,
	[BranchCode] [nvarchar](20) NULL,
	[BankACNumber] [nvarchar](255) NULL,
	[IFSCCode] [nvarchar](255) NULL,
	[Load_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAdvancePayCash]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAdvancePayCash](
	[AdvancePayAutoID] [int] IDENTITY(1,1) NOT NULL,
	[AgentNo] [nvarchar](255) NULL,
	[AdvDate] [int] NULL,
	[EffectiveStartDateForRecovery] [int] NULL,
	[Amount] [float] NULL,
	[Recoverable] [bit] NULL,
	[Remarks] [nvarchar](50) NULL,
	[MaxRecoverblePerCycle] [float] NULL,
	[NetBalance] [float] NULL,
	[ValidFlag] [int] NULL,
	[Status] [int] NULL,
	[Maker1UID] [nvarchar](50) NULL,
	[MakerName] [nvarchar](100) NULL,
	[Makerdate] [int] NULL,
	[MakerTime] [datetime] NULL,
	[CheckerUID] [nvarchar](50) NULL,
	[CheckerName] [nvarchar](100) NULL,
	[Checkerdate] [int] NULL,
	[CheckerTime] [datetime] NULL,
	[Approver1UID] [nvarchar](50) NULL,
	[Approver1Name] [nvarchar](100) NULL,
	[Approver1date] [int] NULL,
	[Approver1Time] [datetime] NULL,
	[Approver1Remarks] [nvarchar](200) NULL,
	[Approver2UID] [nvarchar](50) NULL,
	[Approver2Name] [nvarchar](100) NULL,
	[Approver2date] [int] NULL,
	[Approver2Time] [datetime] NULL,
	[Approver2Remarks] [nvarchar](200) NULL,
	[Approver3UID] [nvarchar](50) NULL,
	[Approver3Name] [nvarchar](100) NULL,
	[Approver3date] [int] NULL,
	[Approver3Time] [datetime] NULL,
	[Approver3Remarks] [nvarchar](200) NULL,
	[PRFNoGenREF] [int] NULL,
	[PRFNo] [nvarchar](100) NULL,
	[PRFGENDate] [int] NULL,
	[ConfirmationEMailAttchFilePath] [nvarchar](300) NULL,
	[ConfirmationEMailAttchBy] [nvarchar](100) NULL,
	[ConfirmationEMailAttchTime] [datetime] NULL,
	[CreateDate] [date] NULL,
	[CollectionDate] [date] NULL,
	[CPT_Option] [nvarchar](10) NULL,
	[TicketCount] [varchar](10) NULL,
	[NetRecovered] [float] NULL,
	[PayRecoverFlag] [nvarchar](10) NULL,
	[PaymentFlag] [smallint] NULL,
	[Paymentdate] [int] NULL,
	[PaymentTime] [datetime] NULL,
	[PRFAmount] [float] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[SVFDateSerial]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SVFDateSerial]
(
  @year int ,
  @month int ,
  @day bigint
)
RETURNS datetime
AS
BEGIN
   DECLARE @date datetime
   -- catch invalid year entries and default appropriately
   SET @year = 
      CASE WHEN @year < 1900 THEN 1900
         WHEN @year > 9999 THEN year(getdate())
         ELSE @year
      END
   -- convert date by adding together like yyyymmdd
   SET @date = cast(@year * 10000 + 101 AS char(8))
   ;
      
   -- Add to date the proper months subtracting 1,
   -- since we used 1 as start instead of zero.    
   SET @date = dateadd(mm , @month - 1 , @date)
   -- Add to date the proper days subtracting 1,
   -- since we used 1 as start instead of zero.    
   SET @date = dateadd(dd , @day - 1 , @date)
   ;
      
   RETURN @date ;
END
GO
/****** Object:  Table [dbo].[tblTransactionTickets]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTransactionTickets](
	[TransAutoId] [int] IDENTITY(1,1) NOT NULL,
	[ContestID] [int] NOT NULL,
	[ContestName] [nvarchar](100) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[AgentNo] [nvarchar](255) NULL,
	[LoadDate] [int] NULL,
	[Createddate] [int] NULL,
	[TicketLists] [int] NOT NULL,
	[NetValue] [float] NULL,
	[NetPayable] [float] NULL,
	[NetPaid] [float] NULL,
	[PreviousPaid] [float] NULL,
	[BalancePayable] [float] NULL,
	[PreviousNetPayable] [float] NULL,
	[Option] [nvarchar](20) NULL,
	[DestID] [int] NULL,
	[RuleName] [nvarchar](255) NULL,
	[Seq] [nvarchar](255) NULL,
	[ValidFlag] [smallint] NOT NULL,
	[PaymentFlag] [smallint] NOT NULL,
	[EntryFlag] [int] NOT NULL,
	[RecordCreateDate] [int] NULL,
	[SelectRecrd] [bit] NULL,
	[Status] [int] NULL,
	[Remarks] [nvarchar](200) NULL,
	[AGTYPES] [varchar](50) NULL,
	[Maker1UID] [nvarchar](50) NULL,
	[MakerName] [nvarchar](100) NULL,
	[Makerdate] [int] NULL,
	[MakerTime] [datetime] NULL,
	[CheckerUID] [nvarchar](50) NULL,
	[CheckerName] [nvarchar](100) NULL,
	[Checkerdate] [int] NULL,
	[CheckerTime] [datetime] NULL,
	[DeviationApprUID] [nvarchar](50) NULL,
	[DeviationApprName] [nvarchar](100) NULL,
	[DeviationApprdate] [int] NULL,
	[DeviationApprTime] [datetime] NULL,
	[DeviationApprRemarks] [nvarchar](200) NULL,
	[Approver1UID] [nvarchar](50) NULL,
	[Approver1Name] [nvarchar](100) NULL,
	[Approver1date] [int] NULL,
	[Approver1Time] [datetime] NULL,
	[Approver1Remarks] [nvarchar](200) NULL,
	[Approver2UID] [nvarchar](50) NULL,
	[Approver2Name] [nvarchar](100) NULL,
	[Approver2date] [int] NULL,
	[Approver2Time] [datetime] NULL,
	[Approver2Remarks] [nvarchar](200) NULL,
	[Approver3UID] [nvarchar](50) NULL,
	[Approver3Name] [nvarchar](100) NULL,
	[Approver3date] [int] NULL,
	[Approver3Time] [datetime] NULL,
	[Approver3Remarks] [nvarchar](200) NULL,
	[Paymentdate] [int] NULL,
	[PaymentTime] [datetime] NULL,
	[PRFAmount] [float] NULL,
	[PRFNoGenREF] [int] NULL,
	[PRFNo] [nvarchar](100) NULL,
	[PRFGENDate] [int] NULL,
	[PRFComment] [nvarchar](300) NULL,
	[ConfirmationEMailAttchFilePath] [nvarchar](300) NULL,
	[ConfirmationEMailAttchBy] [nvarchar](100) NULL,
	[ConfirmationEMailAttchTime] [datetime] NULL,
	[CycleCount] [float] NULL,
	[CurrTicketsCount] [int] NULL,
	[PriTicketsCount] [int] NULL,
	[NetValueTicket] [int] NULL,
	[NetRecoverdTickets] [int] NULL,
	[NetPayableTickes] [int] NULL,
	[QualifiedTickets] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=NEW PIPELINE RECORD;2=OLD PIPELINE RECORD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblTransactionTickets', @level2type=N'COLUMN',@level2name=N'ValidFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=NOT RECEIVED FROM FINANCE;2=RECEIVED FROM FINANCE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblTransactionTickets', @level2type=N'COLUMN',@level2name=N'PaymentFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=DEVIATION;2=CALIDUS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblTransactionTickets', @level2type=N'COLUMN',@level2name=N'EntryFlag'
GO
/****** Object:  Table [dbo].[tblTransactionPoints]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTransactionPoints](
	[TransAutoId] [int] IDENTITY(1,1) NOT NULL,
	[ContestID] [int] NOT NULL,
	[ContestName] [nvarchar](100) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[AgentNo] [nvarchar](255) NULL,
	[LoadDate] [int] NULL,
	[NetPoints] [float] NULL,
	[NetPayable] [float] NULL,
	[NetPaid] [float] NULL,
	[PreviousPaid] [float] NULL,
	[BalancePayable] [float] NULL,
	[PreviousNetPayable] [float] NULL,
	[ValidFlag] [smallint] NOT NULL,
	[PaymentFlag] [smallint] NOT NULL,
	[EntryFlag] [int] NOT NULL,
	[RecordCreateDate] [int] NOT NULL,
	[PRFNum] [nvarchar](100) NULL,
	[SelectRecrd] [bit] NULL,
	[Status] [int] NULL,
	[Remarks] [nvarchar](100) NULL,
	[AGTYPES] [varchar](50) NULL,
	[Maker1UID] [nvarchar](50) NULL,
	[MakerName] [nvarchar](100) NULL,
	[Makerdate] [int] NULL,
	[MakerTime] [datetime] NULL,
	[CheckerUID] [nvarchar](50) NULL,
	[CheckerName] [nvarchar](100) NULL,
	[Checkerdate] [int] NULL,
	[CheckerTime] [datetime] NULL,
	[DeviationApprUID] [nvarchar](50) NULL,
	[DeviationApprName] [nvarchar](100) NULL,
	[DeviationApprdate] [int] NULL,
	[DeviationApprTime] [datetime] NULL,
	[DeviationApprRemarks] [nvarchar](200) NULL,
	[Approver1UID] [nvarchar](50) NULL,
	[Approver1Name] [nvarchar](100) NULL,
	[Approver1date] [int] NULL,
	[Approver1Time] [datetime] NULL,
	[Approver1Remarks] [nvarchar](200) NULL,
	[Approver2UID] [nvarchar](50) NULL,
	[Approver2Name] [nvarchar](100) NULL,
	[Approver2date] [int] NULL,
	[Approver2Time] [datetime] NULL,
	[Approver2Remarks] [nvarchar](200) NULL,
	[Approver3UID] [nvarchar](50) NULL,
	[Approver3Name] [nvarchar](100) NULL,
	[Approver3date] [int] NULL,
	[Approver3Time] [datetime] NULL,
	[Approver3Remarks] [nvarchar](200) NULL,
	[Paymentdate] [int] NULL,
	[PaymentTime] [datetime] NULL,
	[PRFAmount] [float] NULL,
	[PRFNoGenREF] [int] NULL,
	[PRFNo] [nvarchar](100) NULL,
	[PRFGENDate] [int] NULL,
	[PRFComment] [nvarchar](300) NULL,
	[ConfirmationEMailAttchFilePath] [nvarchar](300) NULL,
	[ConfirmationEMailAttchBy] [nvarchar](100) NULL,
	[ConfirmationEMailAttchTime] [datetime] NULL,
	[CycleCount] [float] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=NEW PIPELINE RECORD;2=OLD PIPELINE RECORD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblTransactionPoints', @level2type=N'COLUMN',@level2name=N'ValidFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=NOT RECEIVED FROM FINANCE;2=RECEIVED FROM FINANCE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblTransactionPoints', @level2type=N'COLUMN',@level2name=N'PaymentFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=DEVIATION;2=CALIDUS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblTransactionPoints', @level2type=N'COLUMN',@level2name=N'EntryFlag'
GO
/****** Object:  Table [dbo].[tblTransactionCash]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTransactionCash](
	[TransAutoId] [int] IDENTITY(1,1) NOT NULL,
	[ContestID] [int] NOT NULL,
	[ContestName] [nvarchar](100) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[AgentNo] [nvarchar](255) NULL,
	[LoadDate] [int] NULL,
	[NetAmount] [float] NULL,
	[NetPayable] [float] NULL,
	[NetPaid] [float] NULL,
	[PreviousPaid] [float] NULL,
	[BalancePayable] [float] NULL,
	[PreviousNetPayable] [float] NULL,
	[ValidFlag] [smallint] NOT NULL,
	[PaymentFlag] [smallint] NOT NULL,
	[EntryFlag] [int] NOT NULL,
	[RecordCreateDate] [int] NOT NULL,
	[PRFNum] [nvarchar](100) NULL,
	[SelectRecrd] [bit] NULL,
	[Status] [int] NULL,
	[Remarks] [nvarchar](200) NULL,
	[AGTYPES] [varchar](50) NULL,
	[Maker1UID] [nvarchar](50) NULL,
	[MakerName] [nvarchar](100) NULL,
	[Makerdate] [int] NULL,
	[MakerTime] [datetime] NULL,
	[CheckerUID] [nvarchar](50) NULL,
	[CheckerName] [nvarchar](100) NULL,
	[Checkerdate] [int] NULL,
	[CheckerTime] [datetime] NULL,
	[DeviationApprUID] [nvarchar](50) NULL,
	[DeviationApprName] [nvarchar](100) NULL,
	[DeviationApprdate] [int] NULL,
	[DeviationApprTime] [datetime] NULL,
	[DeviationApprRemarks] [nvarchar](200) NULL,
	[Approver1UID] [nvarchar](50) NULL,
	[Approver1Name] [nvarchar](100) NULL,
	[Approver1date] [int] NULL,
	[Approver1Time] [datetime] NULL,
	[Approver1Remarks] [nvarchar](200) NULL,
	[Approver2UID] [nvarchar](50) NULL,
	[Approver2Name] [nvarchar](100) NULL,
	[Approver2date] [int] NULL,
	[Approver2Time] [datetime] NULL,
	[Approver2Remarks] [nvarchar](200) NULL,
	[Approver3UID] [nvarchar](50) NULL,
	[Approver3Name] [nvarchar](100) NULL,
	[Approver3date] [int] NULL,
	[Approver3Time] [datetime] NULL,
	[Approver3Remarks] [nvarchar](200) NULL,
	[Paymentdate] [int] NULL,
	[PaymentTime] [datetime] NULL,
	[PRFAmount] [float] NULL,
	[PRFNoGenREF] [int] NULL,
	[PRFNo] [nvarchar](100) NULL,
	[PRFGENDate] [int] NULL,
	[PRFComment] [nvarchar](300) NULL,
	[ConfirmationEMailAttchFilePath] [nvarchar](300) NULL,
	[ConfirmationEMailAttchBy] [nvarchar](100) NULL,
	[ConfirmationEMailAttchTime] [datetime] NULL,
	[CycleCount] [float] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=NEW PIPELINE RECORD;2=OLD PIPELINE RECORD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblTransactionCash', @level2type=N'COLUMN',@level2name=N'ValidFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=NOT RECEIVED FROM FINANCE;2=RECEIVED FROM FINANCE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblTransactionCash', @level2type=N'COLUMN',@level2name=N'PaymentFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=DEVIATION;2=CALIDUS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblTransactionCash', @level2type=N'COLUMN',@level2name=N'EntryFlag'
GO
/****** Object:  Table [dbo].[tbltmpPRFGenSupportTblDMC]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbltmpPRFGenSupportTblDMC](
	[AgentNo] [nvarchar](50) NOT NULL,
	[AgentName] [nvarchar](255) NULL,
	[TranDate] [int] NULL,
	[NetAmount] [float] NULL,
	[RecoverbleAmount] [float] NULL,
	[DeviationAmt] [float] NULL,
	[AdvancePayout] [float] NULL,
	[AdvanceRecoverable] [float] NULL,
	[MaxRecoverableAmt] [float] NULL,
	[NetPayout] [float] NULL,
	[BranchCode] [nvarchar](20) NULL,
	[BankACNumber] [nvarchar](255) NULL,
	[IFSCCode] [nvarchar](255) NULL,
	[IRDNO] [nvarchar](255) NULL,
	[PRFAmount] [float] NULL,
	[PRFNoGenREF] [int] NULL,
	[PRFNo] [nvarchar](100) NULL,
	[PRFGENDate] [int] NULL,
	[PRFComment] [nvarchar](300) NULL,
	[Agtypes] [nvarchar](255) NULL,
	[CostCentreCode] [nvarchar](255) NULL,
	[Channel] [nvarchar](255) NULL,
	[LocationBranchCode] [nvarchar](255) NULL,
	[ModeOfPayment] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbltmpPRFGenSupportTbl]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbltmpPRFGenSupportTbl](
	[AgentNo] [nvarchar](50) NOT NULL,
	[AgentName] [nvarchar](255) NULL,
	[TranDate] [int] NULL,
	[NetAmount] [float] NULL,
	[RecoverbleAmount] [float] NULL,
	[DeviationAmt] [float] NULL,
	[AdvancePayout] [float] NULL,
	[AdvanceRecoverable] [float] NULL,
	[MaxRecoverableAmt] [float] NULL,
	[NetPayout] [float] NULL,
	[BranchCode] [nvarchar](20) NULL,
	[BankACNumber] [nvarchar](255) NULL,
	[IFSCCode] [nvarchar](255) NULL,
	[IRDNO] [nvarchar](255) NULL,
	[PRFAmount] [float] NULL,
	[PRFNoGenREF] [int] NULL,
	[PRFNo] [nvarchar](100) NULL,
	[PRFGENDate] [int] NULL,
	[PRFComment] [nvarchar](300) NULL,
	[Agtypes] [nvarchar](255) NULL,
	[CostCentreCode] [nvarchar](255) NULL,
	[Channel] [nvarchar](255) NULL,
	[LocationBranchCode] [nvarchar](255) NULL,
	[ModeOfPayment] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatusMaster]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatusMaster](
	[StatusAutoID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](255) NOT NULL,
	[ID] [int] NOT NULL,
	[SelectRecrd] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRejectLog]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRejectLog](
	[ContestID] [int] NULL,
	[AgentNo] [nvarchar](255) NULL,
	[LoadDate] [int] NULL,
	[RejectDate] [datetime] NULL,
	[RejectedBy] [nvarchar](255) NULL,
	[CMCounter] [decimal](30, 0) NULL,
	[Advancecounter] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRecoverableCash]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRecoverableCash](
	[TransAutoId] [int] IDENTITY(1,1) NOT NULL,
	[AgentNo] [nvarchar](255) NULL,
	[TranDate] [int] NULL,
	[IncommingAmount] [float] NULL,
	[OpenRecoverableAmont] [float] NULL,
	[PrsntProcessAmont] [float] NULL,
	[RemainAmont] [float] NULL,
	[ValidFlag] [smallint] NOT NULL,
	[RecoveredFlag] [smallint] NULL,
	[SelectRecrd] [bit] NULL,
	[Maker1UID] [nvarchar](50) NULL,
	[MakerName] [nvarchar](100) NULL,
	[Makerdate] [int] NULL,
	[MakerTime] [datetime] NULL,
	[CheckerUID] [nvarchar](50) NULL,
	[CheckerName] [nvarchar](100) NULL,
	[Checkerdate] [int] NULL,
	[CheckerTime] [datetime] NULL,
	[Approver1UID] [nvarchar](50) NULL,
	[Approver1Name] [nvarchar](100) NULL,
	[Approver1date] [int] NULL,
	[Approver1Time] [datetime] NULL,
	[Approver1Remarks] [nvarchar](200) NULL,
	[Approver2UID] [nvarchar](50) NULL,
	[Approver2Name] [nvarchar](100) NULL,
	[Approver2date] [int] NULL,
	[Approver2Time] [datetime] NULL,
	[Approver2Remarks] [nvarchar](200) NULL,
	[Approver3UID] [nvarchar](50) NULL,
	[Approver3Name] [nvarchar](100) NULL,
	[Approver3date] [int] NULL,
	[Approver3Time] [datetime] NULL,
	[Approver3Remarks] [nvarchar](200) NULL,
	[PRFAmount] [float] NULL,
	[PRFNoGenREF] [int] NULL,
	[PRFNo] [nvarchar](100) NULL,
	[PRFGENDate] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPRFNOPreText]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPRFNOPreText](
	[TransAutoId] [int] IDENTITY(1,1) NOT NULL,
	[PRFPretext] [nvarchar](255) NULL,
	[ReportPath] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPRFGenratedTickets]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPRFGenratedTickets](
	[TransAutoId] [int] IDENTITY(1,1) NOT NULL,
	[AgentNo] [nvarchar](255) NULL,
	[AgentName] [nvarchar](255) NULL,
	[TransDate] [float] NULL,
	[TicketLists] [int] NULL,
	[NetAmount] [float] NULL,
	[DeviationAmt] [float] NULL,
	[NetPayout] [float] NULL,
	[BranchCode] [nvarchar](20) NULL,
	[BankACNumber] [nvarchar](255) NULL,
	[IFSCCode] [nvarchar](255) NULL,
	[IRDNO] [nvarchar](255) NULL,
	[PRFAmount] [float] NULL,
	[PRFNoGenREF] [int] NULL,
	[PRFNo] [nvarchar](100) NULL,
	[PRFGENDate] [int] NULL,
	[PRFComment] [ntext] NULL,
	[LockRecord] [bit] NULL,
	[CreatedDate] [int] NULL,
	[Status] [int] NULL,
	[Agtypes] [nvarchar](255) NULL,
	[CostCentreCode] [nvarchar](255) NULL,
	[Channel] [nvarchar](255) NULL,
	[LocationBranchCode] [nvarchar](255) NULL,
	[ModeOfPayment] [nvarchar](255) NULL,
	[PrntCnt] [int] NULL,
	[UTRNO] [varchar](255) NULL,
	[TransferDate] [datetime] NULL,
	[UTRUploadDt] [datetime] NULL,
	[Cid] [numeric](18, 0) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPRFGenratedCash]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPRFGenratedCash](
	[TransAutoId] [int] IDENTITY(1,1) NOT NULL,
	[AgentNo] [nvarchar](255) NULL,
	[AgentName] [nvarchar](255) NULL,
	[TransDate] [float] NULL,
	[NetAmount] [float] NULL,
	[RecoverableAmont] [float] NULL,
	[DeviationAmt] [float] NULL,
	[AdvancePayout] [float] NULL,
	[AdvanceRecoverable] [float] NULL,
	[MaxRecoverableAmt] [float] NULL,
	[NetPayout] [float] NULL,
	[BranchCode] [nvarchar](20) NULL,
	[BankACNumber] [nvarchar](255) NULL,
	[IFSCCode] [nvarchar](255) NULL,
	[IRDNO] [nvarchar](255) NULL,
	[PRFAmount] [float] NULL,
	[PRFNoGenREF] [int] NULL,
	[PRFNo] [nvarchar](100) NULL,
	[PRFGENDate] [int] NULL,
	[PRFComment] [ntext] NULL,
	[LockRecord] [bit] NULL,
	[CreatedDate] [int] NULL,
	[Status] [int] NULL,
	[Agtypes] [nvarchar](255) NULL,
	[CostCentreCode] [nvarchar](255) NULL,
	[Channel] [nvarchar](255) NULL,
	[LocationBranchCode] [nvarchar](255) NULL,
	[ModeOfPayment] [nvarchar](255) NULL,
	[PrntCnt] [int] NULL,
	[UTRNO] [varchar](255) NULL,
	[TransferDate] [datetime] NULL,
	[UTRUploadDt] [datetime] NULL,
	[Cid] [numeric](18, 0) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblLoginInfo]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLoginInfo](
	[Slno] [int] IDENTITY(1,1) NOT NULL,
	[Ename] [nvarchar](255) NOT NULL,
	[UId] [nvarchar](30) NOT NULL,
	[Uname] [nvarchar](30) NOT NULL,
	[Pwd] [nvarchar](30) NOT NULL,
	[Ugrp] [int] NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[LastLogin] [datetime] NULL,
	[Lastreseted] [datetime] NULL,
	[GrupAdmn] [bit] NOT NULL,
	[DOB] [datetime] NOT NULL,
	[Upic] [nvarchar](max) NULL,
	[Createddt] [int] NOT NULL,
	[Createddate] [datetime] NULL,
	[LockRecord] [bit] NOT NULL,
 CONSTRAINT [PK_tblLoginInfo] PRIMARY KEY CLUSTERED 
(
	[UId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGregListAgentType]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGregListAgentType](
	[TransAutoId] [int] IDENTITY(1,1) NOT NULL,
	[AgentType] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGregListAgentNo]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGregListAgentNo](
	[TransAutoId] [int] IDENTITY(1,1) NOT NULL,
	[AgentNo] [nvarchar](255) NOT NULL,
	[AgentType] [nvarchar](255) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_tblGregListAgentNo] PRIMARY KEY CLUSTERED 
(
	[AgentNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDestinationPlace]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDestinationPlace](
	[TransAutoId] [int] IDENTITY(1,1) NOT NULL,
	[DestID] [int] NULL,
	[DestName] [nvarchar](255) NULL,
	[DestDescrp] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCUmap]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCUmap](
	[CUid] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[UId] [nvarchar](30) NOT NULL,
	[Cid] [numeric](18, 0) NOT NULL,
	[Description] [varchar](255) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblCUmap] PRIMARY KEY CLUSTERED 
(
	[CUid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblContract]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContract](
	[TransAutoId] [int] IDENTITY(1,1) NOT NULL,
	[ContestID] [int] NULL,
	[ChdrNum] [int] NULL,
	[AgentNo] [int] NULL,
	[StateCode] [nvarchar](255) NULL,
	[OccDate] [datetime] NULL,
	[Date2] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblContestTripMap]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContestTripMap](
	[TransAutoId] [int] IDENTITY(1,1) NOT NULL,
	[ContestID] [decimal](20, 0) NULL,
	[DestID] [int] NULL,
	[cashAmt] [float] NULL,
	[tripAmt] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblContestMaster]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblContestMaster](
	[ContestAutoId] [int] IDENTITY(1,1) NOT NULL,
	[ContestID] [decimal](20, 0) NOT NULL,
	[CrtDay] [int] NOT NULL,
	[CrtMnt] [int] NOT NULL,
	[CrtYr] [int] NOT NULL,
	[ActiveRecrd] [bit] NOT NULL,
	[ContestName] [nvarchar](100) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[AGTYPES] [varchar](50) NULL,
	[ctstType] [varchar](50) NULL,
	[ConfirmationEMailAttchFilePath] [nvarchar](300) NULL,
	[ConfirmationEMailAttchBy] [nvarchar](100) NULL,
	[ConfirmationEMailAttchTime] [datetime] NULL,
	[CMCounter] [decimal](30, 0) NULL,
	[Incentive_YorN] [nvarchar](10) NULL,
	[Advancecounter] [int] NULL,
	[Cid] [numeric](18, 0) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblChannelMaster]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblChannelMaster](
	[Cid] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ChanelName] [varchar](80) NOT NULL,
	[Description] [varchar](255) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblChannelMaster] PRIMARY KEY CLUSTERED 
(
	[Cid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCAmap]    Script Date: 04/20/2018 17:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCAmap](
	[CAid] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[AgntTypeId] [numeric](18, 0) NOT NULL,
	[Cid] [numeric](18, 0) NOT NULL,
	[Description] [varchar](255) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblCAmap] PRIMARY KEY CLUSTERED 
(
	[CAid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[NewPipeLine]    Script Date: 04/20/2018 17:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
--- ValidFlag -2 : NetAmount=0 AND NetPoint=0 AND NetTickets=0 for 1 Run only AND New Entery of Agent number from 2nd Run on words  
--- EnteryFlag 1 : Deviation Entery  
--- Flage 1 : Current Run values  
--- Flage 2 : Previous Run Values  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
CREATE PROCEDURE [dbo].[NewPipeLine]  
 -- Add the parameters for the stored procedure here  
 @VALIDFLAGE nvarchar(50)= 'C',  
 @VALIDFLAGE_A nvarchar(50)= 'A'  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    -- Insert statements for procedure here  
   
CREATE TABLE #ResponseTableCash(ID INT IDENTITY(1,1),ContestID INT,ContestName NVARCHAR(255),StartDate DATETIME,EndDate DATETIME,AgentNo NVARCHAR(255),LoadDate DATETIME,NetAmount FLOAT,Flag NVARCHAR(5))  
CREATE TABLE #ResponseTableTempCash(ID INT IDENTITY(1,1),ContestID INT,ContestName NVARCHAR(255),StartDate INT,EndDate INT,AgentNo NVARCHAR(255),LoadDate INT,Flag NVARCHAR(5),NetAmount FLOAT)  
CREATE TABLE #ResponseTableTempCash_A(ID INT IDENTITY(1,1),ContestID INT,ContestName NVARCHAR(255),StartDate INT,EndDate INT,AgentNo NVARCHAR(255),LoadDate INT,Flag NVARCHAR(5),NetAmount FLOAT)  
  
CREATE TABLE #ResponseTablePoints(ID INT IDENTITY(1,1),ContestID INT,ContestName NVARCHAR(255),StartDate DATETIME,EndDate DATETIME,AgentNo NVARCHAR(255),LoadDate DATETIME,NetPoints INT,Flag NVARCHAR(5))  
CREATE TABLE #ResponseTableTempPoints(ID INT IDENTITY(1,1),ContestID INT,ContestName NVARCHAR(255),StartDate INT,EndDate INT,AgentNo NVARCHAR(255),LoadDate INT,Flag NVARCHAR(5),NetPoints INT)  
CREATE TABLE #ResponseTableTempPoints_A(ID INT IDENTITY(1,1),ContestID INT,ContestName NVARCHAR(255),StartDate INT,EndDate INT,AgentNo NVARCHAR(255),LoadDate INT,Flag NVARCHAR(5),NetPoints INT)  
--CREATE TABLE #UnionLoadDate(ID INT IDENTITY(1,1),Load_Date INT)  
  
---------- Exide Context/ValidFlag='C'/ValidFlag='A' Start ---------------------------------------------  
CREATE TABLE #TempExideContext (ID INT IDENTITY(1,1),ContestID INT,ContestName NVARCHAR(255),StartDate DATETIME,EndDate DATETIME,AgentNo NVARCHAR(255),LoadDate DATETIME,Flag NVARCHAR(5),  
Rule1 NVARCHAR(100),Payables1 NVARCHAR(100),Rule2 NVARCHAR(100),Payables2 NVARCHAR(100),Rule3 NVARCHAR(100),Payables3 NVARCHAR(100),  
Rule4 NVARCHAR(100),Payables4 NVARCHAR(100),Rule5 NVARCHAR(100),Payables5 NVARCHAR(100),Rule6 NVARCHAR(100),Payables6 NVARCHAR(100),  
Rule7 NVARCHAR(100),Payables7 NVARCHAR(100),Rule8 NVARCHAR(100),Payables8 NVARCHAR(100),Rule9 NVARCHAR(100),Payables9 NVARCHAR(100),  
Rule10 NVARCHAR(100),Payables10 NVARCHAR(100),  
Rule11 NVARCHAR(100),Payables11 NVARCHAR(100),Rule12 NVARCHAR(100),Payables12 NVARCHAR(100),Rule13 NVARCHAR(100),Payables13 NVARCHAR(100),  
Rule14 NVARCHAR(100),Payables14 NVARCHAR(100),Rule15 NVARCHAR(100),Payables15 NVARCHAR(100),Rule16 NVARCHAR(100),Payables16 NVARCHAR(100),  
Rule17 NVARCHAR(100),Payables17 NVARCHAR(100),  
Rule18 NVARCHAR(100),Payables18 NVARCHAR(100),Rule19 NVARCHAR(100),Payables19 NVARCHAR(100),Rule20 NVARCHAR(100),Payables20 NVARCHAR(100),  
Rule21 NVARCHAR(100),Payables21 NVARCHAR(100),  
Rule22 NVARCHAR(100),Payables22 NVARCHAR(100),Rule23 NVARCHAR(100),Payables23 NVARCHAR(100),Rule24 NVARCHAR(100),Payables24 NVARCHAR(100),  
Rule25 NVARCHAR(100),Payables25 NVARCHAR(100),Rule26 NVARCHAR(100),Payables26 NVARCHAR(100),Rule27 NVARCHAR(100),Payables27 NVARCHAR(100),  
Rule28 NVARCHAR(100),Payables28 NVARCHAR(100),  
Rule29 NVARCHAR(100),Payables29 NVARCHAR(100),Rule30 NVARCHAR(100),Payables30 NVARCHAR(100))  
  
INSERT INTO #TempExideContext  
SELECT EC.[ContestID],EC.[Contest Name],EC.[Start_Date],EC.[End_Date],DU.[Agent No],DU.[LoadDate],EC.[Valid Flag],  
DU.[1],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[1] AND DU.[1]<>'') AS Payables1,  
DU.[2],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[2] AND DU.[2]<>'') AS Payables2,  
DU.[3],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[3] AND DU.[3]<>'') AS Payables3,  
DU.[4],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[4] AND DU.[4]<>'') AS Payables4,  
DU.[5],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[5] AND DU.[5]<>'') AS Payables5,  
DU.[6],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[6] AND DU.[6]<>'') AS Payables6,  
DU.[7],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[7] AND DU.[7]<>'') AS Payables7,  
DU.[8],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[8] AND DU.[8]<>'') AS Payables8,  
DU.[9],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[9] AND DU.[9]<>'') AS Payables9,  
DU.[10],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[10] AND DU.[10]<>'') AS Payables10,  
DU.[11],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[11] AND DU.[11]<>'') AS Payables11,  
DU.[12],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[12] AND DU.[12]<>'') AS Payables12,  
DU.[13],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[13] AND DU.[13]<>'') AS Payables13,  
DU.[14],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[14] AND DU.[14]<>'') AS Payables14,  
DU.[15],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[15] AND DU.[15]<>'') AS Payables15,  
DU.[16],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[16] AND DU.[16]<>'') AS Payables16,  
DU.[17],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[17] AND DU.[17]<>'') AS Payables17,  
DU.[18],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[18] AND DU.[18]<>'') AS Payables18,  
DU.[19],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[19] AND DU.[19]<>'') AS Payables19,  
DU.[20],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[20] AND DU.[20]<>'') AS Payables20,  
DU.[21],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[21] AND DU.[21]<>'') AS Payables21,  
DU.[22],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[22] AND DU.[22]<>'') AS Payables22,  
DU.[23],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[23] AND DU.[23]<>'') AS Payables23,  
DU.[24],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[24] AND DU.[24]<>'') AS Payables24,  
DU.[25],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[25] AND DU.[25]<>'') AS Payables25,  
DU.[26],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[26] AND DU.[26]<>'') AS Payables26,  
DU.[27],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[27] AND DU.[27]<>'') AS Payables27,  
DU.[28],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[28] AND DU.[28]<>'') AS Payables28,  
DU.[29],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[29] AND DU.[29]<>'') AS Payables29,  
DU.[30],(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[30] AND DU.[30]<>'') AS Payables30  
FROM ExideContest AS EC INNER JOIN ExideReportDataUpdate AS DU ON EC.ContestID=DU.ContestID    
WHERE (EC.[Valid Flag]=@VALIDFLAGE OR EC.[Valid Flag]=@VALIDFLAGE_A)  
ORDER BY EC.[Contest Name]  
--SELECT * FROM #TempExideContext  
---------- Exide Context/ValidFlag='C'/ValidFlag='A' End ---------------------------------------------  
  
------------CMCounter of Cash Table Start----------------  
DECLARE @cmcontestid FLOAT,@Adv INT  
DECLARE CM_Counter CURSOR  
FOR  
SELECT DISTINCT ContestID FROM #TempExideContext  
OPEN CM_Counter  
FETCH NEXT FROM CM_Counter INTO  @cmcontestid  
WHILE @@FETCH_STATUS=0  
BEGIN  
 IF EXISTS(SELECT ContestID FROM tblContestMaster WHERE ContestID=@cmcontestid AND ContestID IN (SELECT ContestID FROM ExideContest WHERE [Valid Flag]!=@VALIDFLAGE_A))  
  BEGIN   
   --MAD, CMCounter SHOULD NOT BE INCREMENTED IF FLAG 'A' IS ENCOUNTERED  
   UPDATE tblContestMaster SET CMCounter=(ISNULL(CMCounter,0)+1) WHERE ContestID=@cmcontestid  
   SET @Adv = (SELECT Advancecounter FROM tblContestMaster WHERE ContestID=@cmcontestid)  
   IF(@Adv=0)  
   BEGIN  
    UPDATE tblContestMaster SET Advancecounter=-1 WHERE ContestID=@cmcontestid  
   END  
   ELSE IF(@Adv IS NULL)  
   BEGIN  
    UPDATE tblContestMaster SET Advancecounter=-2 WHERE ContestID=@cmcontestid  
   END  
     
  END  
  ELSE   
  BEGIN  
   UPDATE tblContestMaster SET Advancecounter=0 WHERE ContestID=@cmcontestid  
  END  
 FETCH NEXT FROM CM_Counter INTO  @cmcontestid  
END  
CLOSE CM_Counter   
DEALLOCATE CM_Counter  
-----------CMCounter of Cash Table End----------------  
  
------------------------Load Date of ExideReportUpdate of Cash Start----------------------  
DECLARE @L_Date_cash DATETIME  
SET @L_Date_cash = (SELECT TOP 1 LoadDate FROM #TempExideContext WHERE Payables1='CASH' OR Payables2='CASH' OR Payables3='CASH' OR  
 Payables4='CASH' OR Payables5='CASH' OR Payables6='CASH' OR Payables7='CASH' OR Payables8='CASH' OR Payables9='CASH' OR  
 Payables10='CASH' OR Payables11='CASH' OR Payables12='CASH' OR Payables13='CASH' OR Payables14='CASH' OR Payables15='CASH' OR  
 Payables16='CASH' OR Payables17='CASH' OR  Payables18='CASH' OR Payables19='CASH' OR Payables20='CASH' OR Payables21='CASH' OR  
Payables22='CASH' OR  Payables23='CASH' OR Payables24='CASH' OR Payables25='CASH' OR Payables26='CASH' OR Payables27='CASH' OR  
Payables28='CASH' OR Payables29='CASH' OR Payables30='CASH'  
 ORDER BY LoadDate DESC)  
 --PRINT @L_Date_cash  
-----------------------Load Date of ExideReportUpdate of Cash End------------------------  
  
-------------------------------CASH START-------------------------------  
INSERT INTO #ResponseTableCash  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule1 as NetAmount,Flag FROM #TempExideContext WHERE (Payables1 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule2 as NetAmount,Flag FROM #TempExideContext WHERE (Payables2 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule3 as NetAmount,Flag FROM #TempExideContext WHERE (Payables3 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule4 as NetAmount,Flag FROM #TempExideContext WHERE (Payables4 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule5 as NetAmount,Flag FROM #TempExideContext WHERE (Payables5 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule6 as NetAmount,Flag FROM #TempExideContext WHERE (Payables6 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule7 as NetAmount,Flag FROM #TempExideContext WHERE (Payables7 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule8 as NetAmount,Flag FROM #TempExideContext WHERE (Payables8 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule9 as NetAmount,Flag FROM #TempExideContext WHERE (Payables9 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule10 as NetAmount,Flag FROM #TempExideContext WHERE (Payables10 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule11 as NetAmount,Flag FROM #TempExideContext WHERE (Payables11 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule12 as NetAmount,Flag FROM #TempExideContext WHERE (Payables12 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule13 as NetAmount,Flag FROM #TempExideContext WHERE (Payables13 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule14 as NetAmount,Flag FROM #TempExideContext WHERE (Payables14 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule15 as NetAmount,Flag FROM #TempExideContext WHERE (Payables15 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule16 as NetAmount,Flag FROM #TempExideContext WHERE (Payables16 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule17 as NetAmount,Flag FROM #TempExideContext WHERE (Payables17 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule18 as NetAmount,Flag FROM #TempExideContext WHERE (Payables18 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule19 as NetAmount,Flag FROM #TempExideContext WHERE (Payables19 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule20 as NetAmount,Flag FROM #TempExideContext WHERE (Payables20 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule21 as NetAmount,Flag FROM #TempExideContext WHERE (Payables21 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule22 as NetAmount,Flag FROM #TempExideContext WHERE (Payables22 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule23 as NetAmount,Flag FROM #TempExideContext WHERE (Payables23 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule24 as NetAmount,Flag FROM #TempExideContext WHERE (Payables24 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule25 as NetAmount,Flag FROM #TempExideContext WHERE (Payables25 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule26 as NetAmount,Flag FROM #TempExideContext WHERE (Payables26 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule27 as NetAmount,Flag FROM #TempExideContext WHERE (Payables27 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule28 as NetAmount,Flag FROM #TempExideContext WHERE (Payables28 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule29 as NetAmount,Flag FROM #TempExideContext WHERE (Payables29 ='CASH') AND LoadDate=@L_Date_cash  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Rule30 as NetAmount,Flag FROM #TempExideContext WHERE (Payables30 ='CASH') AND LoadDate=@L_Date_cash  
--SELECT * FROM #ResponseTableCash  
  
-------------Insert ValidFlag='C' Data INTO TEMP Table #ResponseTableTempCash Start-------------------------  
INSERT INTO #ResponseTableTempCash  
SELECT ContestID,ContestName,(CAST(YEAR(StartDate) AS BIGINT)*100+MONTH(StartDate))*100+DAY(StartDate) AS StartDate,(CAST(YEAR(EndDate) AS BIGINT)*100+MONTH(EndDate))*100+DAY(EndDate) AS EndDate,AgentNo,(CAST(YEAR(LoadDate) AS BIGINT)*100+MONTH(LoadDate))
*100+DAY(LoadDate) AS LoadDate,Flag,SUM(NetAmount) AS NetAmount FROM #ResponseTableCash   
WHERE Flag IN (@VALIDFLAGE,@VALIDFLAGE_A) GROUP BY ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Flag  
--SELECT * FROM #ResponseTableTempCash  
-------------Insert ValidFlag='C' Data INTO TEMP Table #ResponseTableTempCash End---------------------------  
  
----------Update ValidFlag=2 in tblTransactionCash Table WHERE ValidFlag='C' in #ResponseTableTempCash Start-----------------------  
UPDATE TC   
 SET TC.ValidFlag=2  
 FROM tblTransactionCash AS TC  
 INNER JOIN #ResponseTableTempCash AS TempCash ON  
 TempCash.ContestID=TC.ContestID AND TempCash.AgentNo=TC.AgentNo  
 WHERE TC.ValidFlag=1  
----------Update ValidFlag=2 in tblTransactionCash Table WHERE ValidFlag='C' in #ResponseTableTempCash End-------------------------   
  
   
----------Insert INTO tblTransactionCash Table WHERE ValidFlag='C' Start------------------------------  
  
SELECT DISTINCT ContestID,(SELECT ISNULL(MAX(CycleCount),0)+1 FROM [tblTransactionCash] AS TC WHERE TC.ContestID=rt.ContestID) AS CCC  INTO #TempCC FROM #ResponseTableTempCash rt  
  
--SELECT * FROM #TempCC  
  
INSERT INTO tblTransactionCash(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,NetAmount,NetPayable,NetPaid,ValidFlag,PaymentFlag,EntryFlag,[RecordCreateDate],[Status],CycleCount)  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,NetAmount,0,0,1,1,2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()) AS RecordCreateDate,0,0 FROM  #ResponseTableTempCash   
WHERE ContestID IN (SELECT ContestID FROM tblContestMaster WHERE Advancecounter=0)  
   
INSERT INTO tblTransactionCash(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,NetAmount,NetPayable,NetPaid,ValidFlag,PaymentFlag,EntryFlag,[RecordCreateDate],[Status],CycleCount)  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,NetAmount,0,0,1,1,2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()) AS RecordCreateDate,0,(SELECT CCC FROM #TempCC AS TC WHERE TC.ContestID=RT.ContestID) 
FROM  #ResponseTableTempCash AS RT  
WHERE ContestID IN (SELECT ContestID FROM tblContestMaster WHERE CMCounter=1 AND Advancecounter<>0)  
  
INSERT INTO tblTransactionCash(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,NetAmount,NetPayable,NetPaid,ValidFlag,PaymentFlag,EntryFlag,[RecordCreateDate],[Status],CycleCount)  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,NetAmount,0,0,1,1,2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()) AS RecordCreateDate,0,(SELECT CCC FROM #TempCC AS TC WHERE TC.ContestID=RT.ContestID) 
FROM  #ResponseTableTempCash AS RT  
WHERE AgentNo IN (SELECT AgentNo FROM tblTransactionCash WHERE ValidFlag>0 AND CycleCount>0) AND ContestID IN (SELECT ContestID FROM tblContestMaster WHERE CMCounter>=2 AND Advancecounter<>0)  
  
INSERT INTO tblTransactionCash(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,NetAmount,NetPayable,NetPaid,ValidFlag,PaymentFlag,EntryFlag,[RecordCreateDate],[Status],CycleCount)  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,NetAmount,0,0,1,1,2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()) AS RecordCreateDate,0,(SELECT CCC FROM #TempCC AS TC WHERE TC.ContestID=RT.ContestID) 
FROM  #ResponseTableTempCash  AS RT  
WHERE AgentNo NOT IN (SELECT AgentNo FROM tblTransactionCash WHERE ValidFlag>0 AND CycleCount>0) AND ContestID IN (SELECT ContestID FROM tblContestMaster WHERE CMCounter>=2 AND Advancecounter<>0) AND ContestID IN (SELECT ContestID FROM tblContestMaster 
WHERE Incentive_YorN='Y')  
  
INSERT INTO tblTransactionCash(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,NetAmount,NetPayable,NetPaid,ValidFlag,PaymentFlag,EntryFlag,[RecordCreateDate],[Status],CycleCount)  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,NetAmount,0,0,1,1,2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()) AS RecordCreateDate,0,(SELECT CCC FROM #TempCC AS TC WHERE TC.ContestID=RT.ContestID) 
FROM  #ResponseTableTempCash AS RT   
WHERE AgentNo NOT IN (SELECT AgentNo FROM tblTransactionCash WHERE ValidFlag>0 AND CycleCount>0) AND ContestID IN (SELECT ContestID FROM tblContestMaster WHERE CMCounter>=2 AND Advancecounter<>0) AND ContestID IN (SELECT ContestID FROM tblContestMaster 
WHERE Incentive_YorN='N')  
  
  
----Insert into tblRecoverable Table When present in 0th but not present in 1st run and   
--When NetAmount is Zero in 1st run Start-----------------  
  
IF((SELECT COUNT(ContestID) FROM tblContestMaster WHERE CMCounter=1)>=1)  
BEGIN   
   DECLARE @R_ContestID VARCHAR(100),@R_Agentno VARCHAR(100),@R_NetAmount FLOAT,@R_OpenAmount FLOAT  
  DECLARE Recoverable_Data CURSOR  
  FOR  
    SELECT TC.ContestID,TC.AgentNo,TC.NetAmount FROM  tblTransactionCash AS TC  
    WHERE (NOT EXISTS(SELECT * FROM #ResponseTableTempCash AS RT WHERE TC.ContestID=RT.ContestID AND TC.AgentNo=RT.AgentNo))  
    AND (EXISTS(SELECT * FROM #ResponseTableTempCash AS RT WHERE TC.ContestID=RT.ContestID))  
    AND TC.CycleCount=0 AND TC.PaymentFlag=2 AND  EXISTS (SELECT ContestID FROM tblContestMaster AS tm WHERE tm.CMCounter=1 AND TC.ContestID=tm.ContestID)  
  OPEN Recoverable_Data  
  FETCH NEXT FROM Recoverable_Data INTO @R_ContestID,@R_Agentno,@R_NetAmount  
  WHILE @@FETCH_STATUS = 0  
  BEGIN  
   IF EXISTS (SELECT DISTINCT AgentNo FROM tblRecoverableCash WHERE AgentNo=@R_Agentno AND ValidFlag=1)  
   BEGIN  
    SET @R_OpenAmount  = (SELECT OpenRecoverableAmont FROM tblRecoverableCash WHERE AgentNo=@R_Agentno AND ValidFlag=1)  
    UPDATE tblRecoverableCash SET PRFNo=@R_ContestID, PrsntProcessAmont=(-1*@R_NetAmount),RemainAmont=(OpenRecoverableAmont+@R_NetAmount),ValidFlag=2  
    WHERE AgentNo=@R_Agentno AND ValidFlag=1  
    INSERT INTO tblRecoverableCash(AgentNo,TranDate,OpenRecoverableAmont,PrsntProcessAmont,RemainAmont,ValidFlag,RecoveredFlag)   
    VALUES(@R_Agentno,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),(@R_OpenAmount+@R_NetAmount),0,0,1,1)  
   END  
   ELSE  
   BEGIN  
    INSERT INTO tblRecoverableCash(AgentNo,TranDate,OpenRecoverableAmont,PrsntProcessAmont,RemainAmont,ValidFlag,RecoveredFlag,PRFNo)   
    VALUES(@R_Agentno,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),@R_NetAmount,0,0,2,1,@R_ContestID)  
      
    INSERT INTO tblRecoverableCash(AgentNo,TranDate,OpenRecoverableAmont,PrsntProcessAmont,RemainAmont,ValidFlag,RecoveredFlag)   
    VALUES(@R_Agentno,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),@R_NetAmount,0,0,1,1)  
   END  
   FETCH NEXT FROM Recoverable_Data INTO @R_ContestID,@R_Agentno,@R_NetAmount  
  END  
  CLOSE Recoverable_Data  
  DEALLOCATE Recoverable_Data  
  
  
  DECLARE Recoverable_Data_Zero CURSOR  
  FOR  
   SELECT TC.ContestID,TC.AgentNo,TC.NetAmount FROM  tblTransactionCash AS TC  
    WHERE  EXISTS (SELECT T.AgentNo FROM #ResponseTableTempCash AS T WHERE T.NetAmount=0 AND  T.ContestID=TC.ContestID AND TC.AgentNo=T.AgentNo)  
    AND TC.CycleCount=0 AND TC.PaymentFlag=2 AND  EXISTS (SELECT ContestID FROM tblContestMaster AS mc WHERE CMCounter=1 AND TC.ContestID=mc.ContestID)  
  OPEN Recoverable_Data_Zero  
  FETCH NEXT FROM Recoverable_Data_Zero INTO @R_ContestID,@R_Agentno,@R_NetAmount  
  WHILE @@FETCH_STATUS = 0  
  BEGIN  
   IF EXISTS (SELECT DISTINCT AgentNo FROM tblRecoverableCash WHERE AgentNo=@R_Agentno AND ValidFlag=1)  
   BEGIN  
    SET @R_OpenAmount  = (SELECT OpenRecoverableAmont FROM tblRecoverableCash WHERE AgentNo=@R_Agentno AND ValidFlag=1)  
    UPDATE tblRecoverableCash SET PRFNo=@R_ContestID, PrsntProcessAmont=(-1*@R_NetAmount),RemainAmont=(OpenRecoverableAmont+@R_NetAmount),ValidFlag=2  
    WHERE AgentNo=@R_Agentno AND ValidFlag=1  
    INSERT INTO tblRecoverableCash(AgentNo,TranDate,OpenRecoverableAmont,PrsntProcessAmont,RemainAmont,ValidFlag,RecoveredFlag)   
    VALUES(@R_Agentno,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),(@R_OpenAmount+@R_NetAmount),0,0,1,1)  
   END  
   ELSE  
   BEGIN  
    INSERT INTO tblRecoverableCash(AgentNo,TranDate,OpenRecoverableAmont,PrsntProcessAmont,RemainAmont,ValidFlag,RecoveredFlag,PRFNo)   
    VALUES(@R_Agentno,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),@R_NetAmount,0,0,2,1,@R_ContestID)  
      
    INSERT INTO tblRecoverableCash(AgentNo,TranDate,OpenRecoverableAmont,PrsntProcessAmont,RemainAmont,ValidFlag,RecoveredFlag)   
    VALUES(@R_Agentno,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),@R_NetAmount,0,0,1,1)  
   END  
   FETCH NEXT FROM Recoverable_Data_Zero INTO @R_ContestID,@R_Agentno,@R_NetAmount  
  END  
  CLOSE Recoverable_Data_Zero  
  DEALLOCATE Recoverable_Data_Zero  
END  
  
----Insert into tblRecoverable Table When present in 0th but not present in 1st run and   
--When NetAmount is Zero in 1st run End-----------------  
  
----------Insert INTO tblTransactionCash Table WHERE ValidFlag='C' End------------------------------  
  
  
--------------1st Run NetAmount Zero then From 2nd run on we are doing ValidFlag=-2 WHERE ValidFlag='C' Start--------------------  
DECLARE @c_cntid DECIMAL(20, 0),@c_agnno VARCHAR(100)  
 DECLARE cvalidflagtwo CURSOR  
 FOR  
  SELECT RT.ContestID,RT.AgentNo FROM  #ResponseTableTempCash AS RT  
  WHERE (NOT EXISTS(SELECT * FROM tblTransactionCash AS TC WHERE TC.ContestID=RT.ContestID AND TC.AgentNo=RT.AgentNo AND TC.CycleCount=1))  
  AND (NOT EXISTS(SELECT * FROM tblTransactionTickets AS TT WHERE TT.ContestID=RT.ContestID AND TT.AgentNo=RT.AgentNo AND TT.CycleCount=1))  
  AND  EXISTS (SELECT ContestID FROM tblContestMaster AS cM WHERE CMCounter>=1 AND Incentive_YorN!='Y' AND RT.ContestID=cM.ContestID)  
 OPEN cvalidflagtwo  
 FETCH NEXT FROM cvalidflagtwo INTO @c_cntid,@c_agnno  
 WHILE @@FETCH_STATUS = 0  
 BEGIN  
 --PRINT 'KIO'  
    UPDATE tblTransactionCash SET ValidFlag=-2 WHERE ValidFlag=1 AND ContestID=@c_cntid AND AgentNo=@c_agnno  
  FETCH NEXT FROM cvalidflagtwo INTO @c_cntid,@c_agnno  
 END  
 CLOSE cvalidflagtwo  
 DEALLOCATE cvalidflagtwo  
   
 DECLARE cvalidflagtwo_Zero CURSOR  
 FOR  
  SELECT RT.ContestID,RT.AgentNo FROM  #ResponseTableTempCash AS RT  
  WHERE  EXISTS (SELECT AgentNo FROM tblTransactionCash AS T WHERE  T.CycleCount=1 AND T.NetAmount=0 AND T.ContestID=RT.ContestID AND RT.AgentNo=T.AgentNo)  
  AND  EXISTS (SELECT ContestID FROM tblContestMaster AS v WHERE CMCounter=1 AND RT.ContestID=v.ContestID)  
 OPEN cvalidflagtwo_Zero  
 FETCH NEXT FROM cvalidflagtwo_Zero INTO @c_cntid,@c_agnno  
 WHILE @@FETCH_STATUS = 0  
 BEGIN  
 --PRINT 'KIO_1'  
    UPDATE tblTransactionCash SET ValidFlag=-2 WHERE ValidFlag=1 AND ContestID=@c_cntid AND AgentNo=@c_agnno  
  FETCH NEXT FROM cvalidflagtwo_Zero INTO @c_cntid,@c_agnno  
 END  
 CLOSE cvalidflagtwo_Zero  
 DEALLOCATE cvalidflagtwo_Zero  
   
 DECLARE cvalidflagtwo_Zero_Y CURSOR  
 FOR  
  SELECT RT.ContestID,RT.AgentNo FROM  #ResponseTableTempCash AS RT  
  WHERE  EXISTS (SELECT AgentNo FROM tblTransactionCash AS T WHERE  T.CycleCount=1 AND T.NetAmount=0 AND T.ContestID=RT.ContestID AND RT.AgentNo=T.AgentNo)  
  AND  EXISTS (SELECT ContestID FROM tblContestMaster AS M WHERE CMCounter>=2 AND Incentive_YorN!='Y' AND RT.ContestID=M.ContestID)  
 OPEN cvalidflagtwo_Zero_Y  
 FETCH NEXT FROM cvalidflagtwo_Zero_Y INTO @c_cntid,@c_agnno  
 WHILE @@FETCH_STATUS = 0  
 BEGIN  
 --PRINT 'KIO_2'  
    UPDATE tblTransactionCash SET ValidFlag=-2 WHERE ValidFlag=1 AND ContestID=@c_cntid AND AgentNo=@c_agnno  
  FETCH NEXT FROM cvalidflagtwo_Zero_Y INTO @c_cntid,@c_agnno  
 END  
 CLOSE cvalidflagtwo_Zero_Y  
 DEALLOCATE cvalidflagtwo_Zero_Y  
   
------------1st Run NetAmount Zero then From 2nd run on we are doing ValidFlag=-2 WHERE ValidFlag='C' End--------------------  
  
DROP TABLE #ResponseTableCash  
DROP TABLE #ResponseTableTempCash  
DROP TABLE #ResponseTableTempCash_A  
--------------------------------------CASH END-------------------------------------------------  
  
  
-------------------------------------Points START---------------------------------------------  
  
--------------------Load Date of ExideReportUpdate of Points Start---------------------  
DECLARE @L_Date_points DATETIME  
SET @L_Date_points = (SELECT TOP 1 LoadDate FROM #TempExideContext WHERE Payables1='POINTS' OR Payables2='POINTS' OR Payables3='POINTS' OR  
 Payables4='POINTS' OR Payables5='POINTS' OR Payables6='POINTS' OR Payables7='POINTS' OR Payables8='POINTS' OR Payables9='POINTS' OR  
 Payables10='POINTS' OR Payables11='POINTS' OR Payables12='POINTS' OR Payables13='POINTS' OR Payables14='POINTS' OR Payables15='POINTS' OR  
 Payables16='POINTS' OR Payables17='POINTS' OR  Payables18='POINTS' OR Payables19='POINTS' OR Payables20='POINTS' OR Payables21='POINTS' OR  
Payables22='POINTS' OR  Payables23='POINTS' OR Payables24='POINTS' OR Payables25='POINTS' OR Payables26='POINTS' OR Payables27='POINTS' OR  
Payables28='POINTS' OR Payables29='POINTS' OR Payables30='POINTS'  
 ORDER BY LoadDate DESC)  
--------------------Load Date of ExideReportUpdate of Points End------------------------  
  
INSERT INTO #ResponseTablePoints  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule1)as NetPoints,Flag FROM #TempExideContext WHERE (Payables1 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule2)as NetPoints,Flag FROM #TempExideContext WHERE (Payables2 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule3)as NetPoints,Flag FROM #TempExideContext WHERE (Payables3 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule4)as NetPoints,Flag FROM #TempExideContext WHERE (Payables4 ='POINTS') AND LoadDate=@L_Date_points   
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule5)as NetPoints,Flag FROM #TempExideContext WHERE (Payables5 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule6)as NetPoints,Flag FROM #TempExideContext WHERE (Payables6 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule7)as NetPoints,Flag FROM #TempExideContext WHERE (Payables7 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule8)as NetPoints,Flag FROM #TempExideContext WHERE (Payables8 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule9)as NetPoints,Flag FROM #TempExideContext WHERE (Payables9 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule10)as NetPoints,Flag FROM #TempExideContext WHERE (Payables10 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule11)as NetPoints,Flag FROM #TempExideContext WHERE (Payables11 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule12)as NetPoints,Flag FROM #TempExideContext WHERE (Payables12 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule13)as NetPoints,Flag FROM #TempExideContext WHERE (Payables13 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule14)as NetPoints,Flag FROM #TempExideContext WHERE (Payables14 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule15)as NetPoints,Flag FROM #TempExideContext WHERE (Payables15 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule16)as NetPoints,Flag FROM #TempExideContext WHERE (Payables16 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule17)as NetPoints,Flag FROM #TempExideContext WHERE (Payables17 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule18)as NetPoints,Flag FROM #TempExideContext WHERE (Payables18 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule19)as NetPoints,Flag FROM #TempExideContext WHERE (Payables19 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule20)as NetPoints,Flag FROM #TempExideContext WHERE (Payables20 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule21)as NetPoints,Flag FROM #TempExideContext WHERE (Payables21 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule22)as NetPoints,Flag FROM #TempExideContext WHERE (Payables22 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule23)as NetPoints,Flag FROM #TempExideContext WHERE (Payables23 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule24)as NetPoints,Flag FROM #TempExideContext WHERE (Payables24 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule25)as NetPoints,Flag FROM #TempExideContext WHERE (Payables25 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule26)as NetPoints,Flag FROM #TempExideContext WHERE (Payables26 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule27)as NetPoints,Flag FROM #TempExideContext WHERE (Payables27 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule28)as NetPoints,Flag FROM #TempExideContext WHERE (Payables28 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule29)as NetPoints,Flag FROM #TempExideContext WHERE (Payables29 ='POINTS') AND LoadDate=@L_Date_points  
UNION ALL   
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,(Rule30)as NetPoints,Flag FROM #TempExideContext WHERE (Payables30 ='POINTS') AND LoadDate=@L_Date_points  
  
INSERT INTO #ResponseTableTempPoints  
SELECT ContestID,ContestName,(CAST(YEAR(StartDate) AS BIGINT)*100+MONTH(StartDate))*100+DAY(StartDate) AS StartDate,(CAST(YEAR(EndDate) AS BIGINT)*100+MONTH(EndDate))*100+DAY(EndDate) AS EndDate,AgentNo,(CAST(YEAR(LoadDate) AS BIGINT)*100+MONTH(LoadDate))
*100+DAY(LoadDate) AS LoadDate,Flag,SUM(NetPoints) AS NetPoints FROM #ResponseTablePoints   
WHERE Flag IN (@VALIDFLAGE,@VALIDFLAGE_A) GROUP BY ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Flag  
  
UPDATE TP   
 SET TP.ValidFlag=2  
 FROM tblTransactionPoints AS TP  
 INNER JOIN #ResponseTableTempPoints AS TempPoints ON  
 TempPoints.ContestID=TP.ContestID AND TempPoints.AgentNo=TP.AgentNo  
 WHERE TP.ValidFlag=1  
   
INSERT INTO tblTransactionPoints(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,NetPoints,NetPayable,NetPaid,ValidFlag,PaymentFlag,EntryFlag,RecordCreateDate,[Status])  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,NetPoints,0,0,1,1,2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()) AS RecordCreateDate,0 FROM  #ResponseTableTempPoints   
WHERE ContestID IN (SELECT ContestID FROM tblContestMaster WHERE CMCounter=1)  
  
INSERT INTO tblTransactionPoints(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,NetPoints,NetPayable,NetPaid,ValidFlag,PaymentFlag,EntryFlag,RecordCreateDate,[Status])  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,NetPoints,0,0,1,1,2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()) AS RecordCreateDate,0 FROM  #ResponseTableTempPoints   
WHERE AgentNo IN (SELECT AgentNo FROM tblTransactionPoints WHERE ValidFlag>0) AND ContestID IN (SELECT ContestID FROM tblContestMaster WHERE CMCounter>=2)  
  
INSERT INTO tblTransactionPoints(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,NetPoints,NetPayable,NetPaid,ValidFlag,PaymentFlag,EntryFlag,RecordCreateDate,[Status])  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,NetPoints,0,0,1,1,2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()) AS RecordCreateDate,0 FROM  #ResponseTableTempPoints   
WHERE AgentNo NOT IN (SELECT AgentNo FROM tblTransactionPoints WHERE ValidFlag>0) AND ContestID IN (SELECT ContestID FROM tblContestMaster WHERE CMCounter>=2)AND ContestID IN (SELECT ContestID FROM tblContestMaster WHERE Incentive_YorN='Y')  
  
INSERT INTO tblTransactionPoints(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,NetPoints,NetPayable,NetPaid,ValidFlag,PaymentFlag,EntryFlag,RecordCreateDate,[Status])  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,NetPoints,0,0,-1,1,2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()) AS RecordCreateDate,0 FROM  #ResponseTableTempPoints   
WHERE AgentNo NOT IN (SELECT AgentNo FROM tblTransactionPoints WHERE ValidFlag>0) AND ContestID IN (SELECT ContestID FROM tblContestMaster WHERE CMCounter>=2) AND ContestID IN (SELECT ContestID FROM tblContestMaster WHERE Incentive_YorN='N')  
  
-------NetAmount Zero Start-------------------------------------------  
DECLARE @p_cntid DECIMAL(20, 0),@p_agnno FLOAT  
 DECLARE pvalidflagtwo CURSOR  
 FOR  
  SELECT ContestID,AgentNo FROM tblTransactionPoints WHERE ValidFlag=2 AND NetPoints=0   
  AND ContestID IN (SELECT ContestID FROM tblContestMaster WHERE CMCounter>=2)  
  AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionPoints ORDER BY LoadDate ASC)  
 OPEN pvalidflagtwo  
 FETCH NEXT FROM pvalidflagtwo INTO @p_cntid,@p_agnno  
 WHILE @@FETCH_STATUS = 0  
 BEGIN  
    UPDATE tblTransactionPoints SET ValidFlag=-2 WHERE ValidFlag=1 AND ContestID=@p_cntid AND AgentNo=@p_agnno  
  FETCH NEXT FROM pvalidflagtwo INTO @p_cntid,@p_agnno  
 END  
 CLOSE pvalidflagtwo  
 DEALLOCATE pvalidflagtwo  
-------NetAmount Zero End---------------------------------------------   
  
DROP TABLE #ResponseTablePoints  
DROP TABLE #ResponseTableTempPoints  
DROP TABLE #ResponseTableTempPoints_A  
-----------------------------------------Points END-------------------------------------------------------  
  
  
-----------------------------------------Tickets START------------------------------------------------------  
  
CREATE TABLE #ResponseTableTickets(ID INT IDENTITY(1,1),ContestID INT,ContestName NVARCHAR(255),StartDate DATETIME,EndDate DATETIME,AgentNo NVARCHAR(255),LoadDate DATETIME,Seq FLOAT,RuleName NVARCHAR(255),DestId NVARCHAR(255),NetTickets FLOAT,Flag NVARCHAR(5))  
CREATE TABLE #ResponseTableTempTickets(ID INT IDENTITY(1,1),ContestID INT,ContestName NVARCHAR(255),StartDate INT,EndDate INT,AgentNo NVARCHAR(255),LoadDate INT,Seq FLOAT,RuleName NVARCHAR(255),DestId NVARCHAR(255),Flag NVARCHAR(5),NetTickets FLOAT,currticketscount INT,priticketscount INT)  
  
CREATE TABLE #TempExideContextforTickets (ID INT IDENTITY(1,1),ContestID INT,ContestName NVARCHAR(255),StartDate DATETIME,EndDate DATETIME,AgentNo NVARCHAR(255),LoadDate DATETIME,Flag NVARCHAR(5),  
Rule1 NVARCHAR(100),Seq1 NVARCHAR(100),RuleName1 NVARCHAR(100),one1 NVARCHAR(100),Payables1 NVARCHAR(100),Rule2 NVARCHAR(100),Seq2 NVARCHAR(100),RuleName2 NVARCHAR(100),one2 NVARCHAR(100),Payables2 NVARCHAR(100),Rule3 NVARCHAR(100),Seq3 NVARCHAR(100),
RuleName3 NVARCHAR(100),one3 NVARCHAR(100),Payables3 NVARCHAR(100), 
Rule4 NVARCHAR(100),Seq4 NVARCHAR(100),RuleName4 NVARCHAR(100),one4 NVARCHAR(100),Payables4 NVARCHAR(100),Rule5 NVARCHAR(100),Seq5 NVARCHAR(100),RuleName5 NVARCHAR(100),one5 NVARCHAR(100),Payables5 NVARCHAR(100),Rule6 NVARCHAR(100),Seq6 NVARCHAR(100),
RuleName6 NVARCHAR(100),one6 NVARCHAR(100),Payables6 NVARCHAR(100),  
Rule7 NVARCHAR(100),Seq7 NVARCHAR(100),RuleName7 NVARCHAR(100),one7 NVARCHAR(100),Payables7 NVARCHAR(100),Rule8 NVARCHAR(100),Seq8 NVARCHAR(100),RuleName8 NVARCHAR(100),one8 NVARCHAR(100),Payables8 NVARCHAR(100),Rule9 NVARCHAR(100),Seq9 NVARCHAR(100),
RuleName9 NVARCHAR(100),one9 NVARCHAR(100),Payables9 NVARCHAR(100),  
Rule10 NVARCHAR(100),Seq10 NVARCHAR(100),RuleName10 NVARCHAR(100),one10 NVARCHAR(100),Payables10 NVARCHAR(100),  
Rule11 NVARCHAR(100),Seq11 NVARCHAR(100),RuleName11 NVARCHAR(100),one11 NVARCHAR(100),Payables11 NVARCHAR(100),Rule12 NVARCHAR(100),Seq12 NVARCHAR(100),RuleName12 NVARCHAR(100),one12 NVARCHAR(100),Payables12 NVARCHAR(100),Rule13 NVARCHAR(100),
Seq13 NVARCHAR(100),RuleName13 NVARCHAR(100),one13 NVARCHAR(100),Payables13 NVARCHAR(100),  
Rule14 NVARCHAR(100),Seq14 NVARCHAR(100),RuleName14 NVARCHAR(100),one14 NVARCHAR(100),Payables14 NVARCHAR(100),Rule15 NVARCHAR(100),Seq15 NVARCHAR(100),RuleName15 NVARCHAR(100),one15 NVARCHAR(100),Payables15 NVARCHAR(100),Rule16 NVARCHAR(100),
Seq16 NVARCHAR(100),RuleName16 NVARCHAR(100),one16 NVARCHAR(100),Payables16 NVARCHAR(100),  
Rule17 NVARCHAR(100),Seq17 NVARCHAR(100),RuleName17 NVARCHAR(100),one17 NVARCHAR(100),Payables17 NVARCHAR(100),  
Rule18 NVARCHAR(100),Seq18 NVARCHAR(100),RuleName18 NVARCHAR(100),one18 NVARCHAR(100),Payables18 NVARCHAR(100),Rule19 NVARCHAR(100),Seq19 NVARCHAR(100),RuleName19 NVARCHAR(100),one19 NVARCHAR(100),Payables19 NVARCHAR(100),Rule20 NVARCHAR(100),
Seq20 NVARCHAR(100),RuleName20 NVARCHAR(100),one20 NVARCHAR(100),Payables20 NVARCHAR(100),  
Rule21 NVARCHAR(100),Seq21 NVARCHAR(100),RuleName21 NVARCHAR(100),one21 NVARCHAR(100),Payables21 NVARCHAR(100),  
Rule22 NVARCHAR(100),Seq22 NVARCHAR(100),RuleName22 NVARCHAR(100),one22 NVARCHAR(100),Payables22 NVARCHAR(100),Rule23 NVARCHAR(100),Seq23 NVARCHAR(100),RuleName23 NVARCHAR(100),one23 NVARCHAR(100),Payables23 NVARCHAR(100),Rule24 NVARCHAR(100),
Seq24 NVARCHAR(100),RuleName24 NVARCHAR(100),one24 NVARCHAR(100),Payables24 NVARCHAR(100),  
Rule25 NVARCHAR(100),Seq25 NVARCHAR(100),RuleName25 NVARCHAR(100),one25 NVARCHAR(100),Payables25 NVARCHAR(100),Rule26 NVARCHAR(100),Seq26 NVARCHAR(100),RuleName26 NVARCHAR(100),one26 NVARCHAR(100),Payables26 NVARCHAR(100),Rule27 NVARCHAR(100),
Seq27 NVARCHAR(100),RuleName27 NVARCHAR(100),one27 NVARCHAR(100),Payables27 NVARCHAR(100),  
Rule28 NVARCHAR(100),Seq28 NVARCHAR(100),RuleName28 NVARCHAR(100),one28 NVARCHAR(100),Payables28 NVARCHAR(100),  
Rule29 NVARCHAR(100),Seq29 NVARCHAR(100),RuleName29 NVARCHAR(100),one29 NVARCHAR(100),Payables29 NVARCHAR(100),Rule30 NVARCHAR(100),Seq30 NVARCHAR(100),RuleName30 NVARCHAR(100),one30 NVARCHAR(100),Payables30 NVARCHAR(100))  
  
INSERT INTO #TempExideContextforTickets  
SELECT EC.[ContestID],EC.[Contest Name],EC.[Start_Date],EC.[End_Date],DU.[Agent No],DU.[LoadDate],[Valid Flag],  
DU.[1],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[1] AND DU.[1]<>'') AS Seq1,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[1] AND DU.[1]<>'') AS RuleName1,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[1] AND DU.[1]<>'') AS one1,(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[1] AND DU.[1]<>'') AS Payables1,  
DU.[2],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[2] AND DU.[2]<>'') AS Seq2,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[2] AND DU.[2]<>'') AS RuleName2,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[2] AND DU.[2]<>'') AS one2,(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[2] AND DU.[2]<>'') AS Payables2,  
DU.[3],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[3] AND DU.[3]<>'') AS Seq3,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[3] AND DU.[3]<>'') AS RuleName3,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[3] AND DU.[3]<>'') AS one3,(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[3] AND DU.[3]<>'') AS Payables3,  
DU.[4],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[4] AND DU.[4]<>'') AS Seq4,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[4] AND DU.[4]<>'') AS RuleName4,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[4] AND DU.[4]<>'') AS one4,(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[4] AND DU.[4]<>'') AS Payables4,  
DU.[5],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[5] AND DU.[5]<>'') AS Seq5,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[5] AND DU.[5]<>'') AS RuleName5,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[5] AND DU.[5]<>'') AS one5,(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[5] AND DU.[5]<>'') AS Payables5,  
DU.[6],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[6] AND DU.[6]<>'') AS Seq6,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[6] AND DU.[6]<>'') AS RuleName6,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[6] AND DU.[6]<>'') AS one6,(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[6] AND DU.[6]<>'') AS Payables6,  
DU.[7],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[7] AND DU.[7]<>'') AS Seq7,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[7] AND DU.[7]<>'') AS RuleName7,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[7] AND DU.[7]<>'') AS one7,(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[7] AND DU.[7]<>'') AS Payables7,  
DU.[8],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[8] AND DU.[8]<>'') AS Seq8,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[8] AND DU.[8]<>'') AS RuleName8,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[8] AND DU.[8]<>'') AS one8,(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[8] AND DU.[8]<>'') AS Payables8,  
DU.[9],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[9] AND DU.[9]<>'') AS Seq9,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[9] AND DU.[9]<>'') AS RuleName9,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[9] AND DU.[9]<>'') AS one9,(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[9] AND DU.[9]<>'') AS Payables9,  
DU.[10],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[10] AND DU.[10]<>'') AS Seq10,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[10] AND DU.[10]<>'') AS RuleName10,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[10] AND DU.[10]<>'') AS one10,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[10] AND DU.[10]<>'') AS Payables10,  
DU.[11],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[11] AND DU.[11]<>'') AS Seq11,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[11] AND DU.[11]<>'') AS RuleName11,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[11] AND DU.[11]<>'') AS one11,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[11] AND DU.[11]<>'') AS Payables11,  
DU.[12],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[12] AND DU.[12]<>'') AS Seq12,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[12] AND DU.[12]<>'') AS RuleName12,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[12] AND DU.[12]<>'') AS one12,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[12] AND DU.[12]<>'') AS Payables12,  
DU.[13],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[13] AND DU.[13]<>'') AS Seq13,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[13] AND DU.[13]<>'') AS RuleName13,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[13] AND DU.[13]<>'') AS one13,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[13] AND DU.[13]<>'') AS Payables13,  
DU.[14],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[14] AND DU.[14]<>'') AS Seq14,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[14] AND DU.[14]<>'') AS RuleName14,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[14] AND DU.[14]<>'') AS one14,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[14] AND DU.[14]<>'') AS Payables14,  
DU.[15],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[15] AND DU.[15]<>'') AS Seq15,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[15] AND DU.[15]<>'') AS RuleName15,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[15] AND DU.[15]<>'') AS one15,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[15] AND DU.[15]<>'') AS Payables15,  
DU.[16],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[16] AND DU.[16]<>'') AS Seq16,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[16] AND DU.[16]<>'') AS RuleName16,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[16] AND DU.[16]<>'') AS one16,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[16] AND DU.[16]<>'') AS Payables16,  
DU.[17],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[17] AND DU.[17]<>'') AS Seq17,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[17] AND DU.[17]<>'') AS RuleName17,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[17] AND DU.[17]<>'') AS one17,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[17] AND DU.[17]<>'') AS Payables17,  
DU.[18],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[18] AND DU.[18]<>'') AS Seq18,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[18] AND DU.[18]<>'') AS RuleName18,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[18] AND DU.[18]<>'') AS one18,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[18] AND DU.[18]<>'') AS Payables18,  
DU.[19],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[19] AND DU.[19]<>'') AS Seq19,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[19] AND DU.[19]<>'') AS RuleName19,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[19] AND DU.[19]<>'') AS one19,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[19] AND DU.[19]<>'') AS Payables19,  
DU.[20],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[20] AND DU.[20]<>'') AS Seq20,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[20] AND DU.[20]<>'') AS RuleName20,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[20] AND DU.[20]<>'') AS one20,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[20] AND DU.[20]<>'') AS Payables20,  
DU.[21],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[21] AND DU.[21]<>'') AS Seq21,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[21] AND DU.[21]<>'') AS RuleName21,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[21] AND DU.[21]<>'') AS one21,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[21] AND DU.[21]<>'') AS Payables21,  
DU.[22],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[22] AND DU.[22]<>'') AS Seq22,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[22] AND DU.[22]<>'') AS RuleName22,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[22] AND DU.[22]<>'') AS one22,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[22] AND DU.[22]<>'') AS Payables22,  
DU.[23],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[23] AND DU.[23]<>'') AS Seq23,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[23] AND DU.[23]<>'') AS RuleName23,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[23] AND DU.[23]<>'') AS one23,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[23] AND DU.[23]<>'') AS Payables23,  
DU.[24],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[24] AND DU.[24]<>'') AS Seq24,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[24] AND DU.[24]<>'') AS RuleName24,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[24] AND DU.[24]<>'') AS one24,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[24] AND DU.[24]<>'') AS Payables24,  
DU.[25],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[25] AND DU.[25]<>'') AS Seq25,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[25] AND DU.[25]<>'') AS RuleName25,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[25] AND DU.[25]<>'') AS one25,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[25] AND DU.[25]<>'') AS Payables25,  
DU.[26],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[26] AND DU.[26]<>'') AS Seq26,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[26] AND DU.[26]<>'') AS RuleName26,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[26] AND DU.[26]<>'') AS one26,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[26] AND DU.[26]<>'') AS Payables26,  
DU.[27],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[27] AND DU.[27]<>'') AS Seq27,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[27] AND DU.[27]<>'') AS RuleName27,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[27] AND DU.[27]<>'') AS one27,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[27] AND DU.[27]<>'') AS Payables27,  
DU.[28],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[28] AND DU.[28]<>'') AS Seq28,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[28] AND DU.[28]<>'') AS RuleName28,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[28] AND DU.[28]<>'') AS one28,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[28] AND DU.[28]<>'') AS Payables28,  
DU.[29],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[29] AND DU.[29]<>'') AS Seq29,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[29] AND DU.[29]<>'') AS RuleName29,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[29] AND DU.[29]<>'') AS one29,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[29] AND DU.[29]<>'') AS Payables29,  
DU.[30],(SELECT Seq FROM ExideRuleEngine WHERE Seq=EC.[30] AND DU.[30]<>'') AS Seq30,(SELECT [Rule Name] FROM ExideRuleEngine WHERE Seq=EC.[30] AND DU.[30]<>'') AS RuleName30,(SELECT [1] FROM ExideRuleEngine WHERE Seq=EC.[30] AND DU.[30]<>'') AS one30,
(SELECT Payable FROM ExideRuleEngine WHERE Seq=EC.[30] AND DU.[30]<>'') AS Payables30  
FROM ExideContest AS EC INNER JOIN ExideReportDataUpdate AS DU ON EC.ContestID=DU.ContestID    
WHERE (EC.[Valid Flag]=@VALIDFLAGE OR EC.[Valid Flag]=@VALIDFLAGE_A)  
ORDER BY EC.[Contest Name]  
  
-----------------------------------Load Date of ExideReportUpdate of Tickets Start---------------------------  
DECLARE @L_Date_tickets DATETIME  
SET @L_Date_tickets = (SELECT TOP 1 LoadDate FROM #TempExideContextforTickets WHERE Payables1='TICKETS' OR Payables2='TICKETS' OR Payables3='TICKETS' OR  
 Payables4='TICKETS' OR Payables5='TICKETS' OR Payables6='TICKETS' OR Payables7='TICKETS' OR Payables8='TICKETS' OR Payables9='TICKETS' OR  
 Payables10='TICKETS' OR Payables11='TICKETS' OR Payables12='TICKETS' OR Payables13='TICKETS' OR Payables14='TICKETS' OR Payables15='TICKETS' OR  
 Payables16='TICKETS' OR Payables17='TICKETS' OR  Payables18='TICKETS' OR Payables19='TICKETS' OR Payables20='TICKETS' OR Payables21='TICKETS' OR  
Payables22='TICKETS' OR  Payables23='TICKETS' OR Payables24='TICKETS' OR Payables25='TICKETS' OR Payables26='TICKETS' OR Payables27='TICKETS' OR  
Payables28='TICKETS' OR Payables29='TICKETS' OR Payables30='TICKETS'  
 ORDER BY LoadDate DESC)  
-- PRINT @L_Date_tickets  
------------------------------------Load Date of ExideReportUpdate of Tickets End------------------------------  
  
  
INSERT INTO #ResponseTableTickets  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq1 as seq,RuleName1 as RuleName,one1 as DestId,(Rule1)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables1 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq2 as seq,RuleName2 as RuleName,one2 as DestId,(Rule2)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables2 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq3 as seq,RuleName3 as RuleName,one3 as DestId,(Rule3)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables3 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq4 as seq,RuleName4 as RuleName,one4 as DestId,(Rule4)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables4 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq5 as seq,RuleName5 as RuleName,one5 as DestId,(Rule5)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables5 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq6 as seq,RuleName6 as RuleName,one6 as DestId,(Rule6)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables6 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq7 as seq,RuleName7 as RuleName,one7 as DestId,(Rule7)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables7 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq8 as seq,RuleName8 as RuleName,one8 as DestId,(Rule8)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables8 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq9 as seq,RuleName9 as RuleName,one9 as DestId,(Rule9)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables9 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq10 as seq,RuleName10 as RuleName,one10 as DestId,(Rule10)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables10 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq11 as seq,RuleName11 as RuleName,one11 as DestId,(Rule11)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables11 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq12 as seq,RuleName12 as RuleName,one12 as DestId,(Rule12)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables12 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq13 as seq,RuleName13 as RuleName,one13 as DestId,(Rule13)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables13 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq14 as seq,RuleName14 as RuleName,one14 as DestId,(Rule14)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables14 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq15 as seq,RuleName15 as RuleName,one15 as DestId,(Rule15)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables15 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq16 as seq,RuleName16 as RuleName,one16 as DestId,(Rule16)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables16 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq17 as seq,RuleName17 as RuleName,one17 as DestId,(Rule17)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables17 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq18 as seq,RuleName18 as RuleName,one18 as DestId,(Rule18)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables18 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq19 as seq,RuleName19 as RuleName,one19 as DestId,(Rule19)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables19 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq20 as seq,RuleName20 as RuleName,one20 as DestId,(Rule20)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables20 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq21 as seq,RuleName21 as RuleName,one21 as DestId,(Rule21)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables21 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq22 as seq,RuleName22 as RuleName,one22 as DestId,(Rule22)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables22 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq23 as seq,RuleName23 as RuleName,one23 as DestId,(Rule23)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables23 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq24 as seq,RuleName24 as RuleName,one24 as DestId,(Rule24)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables24 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq25 as seq,RuleName25 as RuleName,one25 as DestId,(Rule25)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables25 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq26 as seq,RuleName26 as RuleName,one26 as DestId,(Rule26)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables26 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq27 as seq,RuleName27 as RuleName,one27 as DestId,(Rule27)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables27 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq28 as seq,RuleName28 as RuleName,one28 as DestId,(Rule28)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables28 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq29 as seq,RuleName29 as RuleName,one29 as DestId,(Rule29)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables29 ='TICKETS') AND LoadDate=@L_Date_tickets  
UNION ALL  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq30 as seq,RuleName30 as RuleName,one30 as DestId,(Rule30)as NetCash,Flag FROM #TempExideContextforTickets WHERE (Payables30 ='TICKETS') AND LoadDate=@L_Date_tickets  
  
INSERT INTO #ResponseTableTempTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq,RuleName,DestId,Flag,NetTickets)  
SELECT ContestID,ContestName,(CAST(YEAR(StartDate) AS BIGINT)*100+MONTH(StartDate))*100+DAY(StartDate) AS StartDate,(CAST(YEAR(EndDate) AS BIGINT)*100+MONTH(EndDate))*100+DAY(EndDate) AS EndDate,AgentNo,(CAST(YEAR(LoadDate) AS BIGINT)*100+MONTH(LoadDate)
)*100+DAY(LoadDate) AS LoadDate,Seq,RuleName,DestId,Flag,SUM(NetTickets) AS NetTickets FROM #ResponseTableTickets   
WHERE Flag IN(@VALIDFLAGE,@VALIDFLAGE_A) GROUP BY ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq,RuleName,DestId,Flag  
  
UPDATE TT   
 SET TT.ValidFlag=2  
 FROM tblTransactionTickets AS TT  
 INNER JOIN #ResponseTableTempTickets AS TempTickets ON  
 TempTickets.ContestID=TT.ContestID AND TempTickets.AgentNo=TT.AgentNo  
 WHERE TT.ValidFlag=1  
   
--SELECT * FROM #ResponseTableTempTickets  
  
DECLARE @cid INT,@contname NVARCHAR(255),@sd INT,@ed INT,@An INT,@ld INT,@s FLOAT,@rn NVARCHAR(255),@did NVARCHAR(255),@nt FLOAT,@ctc INT,@ptc INT,@CCT FLOAT  
  
---------------------------------------------Advancecounter 0 It Will Run Start------------------------------------------------  
DECLARE TicketsLoopzero CURSOR  
FOR  
 SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq,RuleName,DestId,NetTickets,currticketscount,priticketscount,0 FROM #ResponseTableTempTickets WHERE ContestID IN(SELECT ContestID FROM tblContestMaster WHERE Advancecounter=0)  
 OPEN TicketsLoopzero  
FETCH NEXT FROM TicketsLoopzero INTO @cid,@contname,@sd,@ed,@An,@ld,@s,@rn,@did,@nt,@ctc,@ptc,@CCT  
WHILE @@FETCH_STATUS = 0  
BEGIN  
 IF(@nt!=0)  
 BEGIN  
  INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,CycleCount)  
  VALUES(@cid,@contname,@sd,@ed,@An,@ld,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),1,0,-10,'T',@rn,@s,CAST(@did AS INT),1,1,2,@nt,@nt,0,@CCT)  
    
  INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,CycleCount)  
  VALUES(@cid,@contname,@sd,@ed,@An,@ld,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),2,0,-10,'C',@rn,@s,CAST(@did AS INT),1,1,2,@nt,@nt,0,@CCT)  
 END  
 ELSE IF(@nt=0)  
 BEGIN  
  INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,CycleCount)  
  VALUES(@cid,@contname,@sd,@ed,@An,@ld,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),0,0,-10,'T',@rn,@s,CAST(@did AS INT),-2,1,2,@nt,@nt,0,@CCT)  
    
  INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,CycleCount)  
  VALUES(@cid,@contname,@sd,@ed,@An,@ld,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),0,0,-10,'C',@rn,@s,CAST(@did AS INT),-2,1,2,@nt,@nt,0,@CCT)  
 END  
 FETCH NEXT FROM TicketsLoopzero INTO @cid,@contname,@sd,@ed,@An,@ld,@s,@rn,@did,@nt,@ctc,@ptc,@CCT  
END  
CLOSE TicketsLoopzero  
DEALLOCATE TicketsLoopzero  
---------------------------------------------Advancecounter 0 It Will Run Stop-------------------------------------------------  
  
  
---------------------------------------------Counter 1 It Will Run Start--------------------------------------------------------  
DECLARE TicketsLoop CURSOR  
FOR  
 SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq,RuleName,DestId,NetTickets,currticketscount,priticketscount,(SELECT ISNULL(MAX(CycleCount),0)+1 FROM [tblTransactionTickets] AS TT WHERE TT.ContestID=RT.ContestID) FROM #ResponseTableTempTickets AS RT WHERE ContestID IN(SELECT ContestID FROM tblContestMaster WHERE CMCounter=1 AND Advancecounter=-2)  
 OPEN TicketsLoop  
FETCH NEXT FROM TicketsLoop INTO @cid,@contname,@sd,@ed,@An,@ld,@s,@rn,@did,@nt,@ctc,@ptc,@CCT  
WHILE @@FETCH_STATUS = 0  
BEGIN  
 --SET @nt = (SELECT NetTickets FROM #ResponseTableTempTickets WHERE ContestID=@cid AND AgentNo=@An AND LoadDate=@ld AND DestId=@did)  
 IF(@nt!=0)  
 BEGIN  
  INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,CycleCount)  
  VALUES(@cid,@contname,@sd,@ed,@An,@ld,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),1,0,-10,'T',@rn,@s,CAST(@did AS INT),1,1,2,@nt,@nt,0,@CCT)  
    
  INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,CycleCount)  
  VALUES(@cid,@contname,@sd,@ed,@An,@ld,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),2,0,-10,'C',@rn,@s,CAST(@did AS INT),1,1,2,@nt,@nt,0,@CCT)  
 END  
 ELSE IF(@nt=0)  
 BEGIN  
  INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,CycleCount)  
  VALUES(@cid,@contname,@sd,@ed,@An,@ld,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),0,0,-10,'T',@rn,@s,CAST(@did AS INT),-2,1,2,@nt,@nt,0,@CCT)  
    
  INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,CycleCount)  
  VALUES(@cid,@contname,@sd,@ed,@An,@ld,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),0,0,-10,'C',@rn,@s,CAST(@did AS INT),-2,1,2,@nt,@nt,0,@CCT)  
 END  
 FETCH NEXT FROM TicketsLoop INTO @cid,@contname,@sd,@ed,@An,@ld,@s,@rn,@did,@nt,@ctc,@ptc,@CCT  
END  
CLOSE TicketsLoop  
DEALLOCATE TicketsLoop  
------------------------------------------------Counter 1 It Will Run End--------------------------------------------------------  
  
  
------------------------------------------------Counter 2 So on Start-------------------------------------------------------------------  
DECLARE @autoid2 INT,@cid2 INT,@contname2 NVARCHAR(255),@sd2 INT,@ed2 INT,@An2 INT,@ld2 INT,@s2 FLOAT,@rn2 NVARCHAR(255),@did2 NVARCHAR(255),@nt2 FLOAT,@ctc2 INT,@ptc2 INT  
DECLARE @previousticketcount INT, @currentticketcount INT,@diffctc_ptcgrt INT,@diffctc_ptcless INT,@netpayablegrt FLOAT,@netvaluegrt FLOAT  
DECLARE @Sum2Run INT,@minnetpaid FLOAT,@netpayableless FLOAT,@netvalueless FLOAT,@previouspaidless FLOAT,@previouspaidgrt FLOAT,@sumofprepreticketscount INT  
DECLARE @diffctc_ptcequal FLOAT,@sumnetpaidequal FLOAT,@netpayablerequal FLOAT,@netvalueequal FLOAT,@previouspaidequal FLOAT,@optiongrt NVARCHAR(25),@optionless NVARCHAR(25),@preloaddate DECIMAL(20,0),@Currentloaddate DECIMAL(20,0)  
DECLARE @minnetpaid1 FLOAT,@Load_Date_Tickes FLOAT  
  
----------------------------------------New Logic DECLARE Start-----------------------------------  
DECLARE @CashNetValueTicket INT,@LoopCashValueTicket INT,@diffctc_ptcless_temp INT,@TicketNetValueTicket INT,@LoopTicketNetValueTicket INT,@CashValue_E INT,@CashPayable_E INT,@TicketPayable_E INT  
DECLARE @Net_Recoverd_Tickets_C INT,@Net_Value_Ticket_C INT,@Net_Payable_Tickes_C INT,@CNV INT,@addtion_C INT,@CashRecoverd_G INT,@TicketPayable_G INT,@TicketValue_E INT,@CountNewAgentNo INT  
DECLARE @Net_Recoverd_Tickets_T INT,@Net_Value_Ticket_T INT,@Net_Payable_Tickes_T INT,@TNVT INT,@CashValue_G INT,@CashPayable_G INT,@TicketValue_G INT,@CashRecoverd_E INT,@CAgY INT  
DECLARE @CashNetValueTicket_G INT,@CashNetRecoverdTickets_G INT,@LoopCash_G INT,@TicketNetRecoverdTickets_G INT,@diff_G INT,@TicketValueTicket_G INT,@TicketRecoverd_E INT  
DECLARE @Cycle_count FLOAT, @Count_cycle Float  
----------------------------------------New Logic DECLARE End--------------------------------------  
  
SET @Cycle_count=0  
  
SELECT ContestID,AgentNo INTO #TempAbsentTickets FROM tblTransactionTickets WHERE CycleCount=0  
EXCEPT  
SELECT ContestID,AgentNo FROM tblTransactionTickets WHERE CycleCount=1  
  
SELECT ContestID,AgentNo INTO #TempNetAmountTickets FROM tblTransactionTickets WHERE CycleCount=0  
INTERSECT  
SELECT ContestID,AgentNo FROM tblTransactionTickets WHERE CycleCount=1 AND CurrTicketsCount=0  
  
SELECT ContestID,AgentNo INTO #TempUnionAbsentAmountTickes FROM #TempAbsentTickets  
UNION ALL  
SELECT ContestID,AgentNo FROM #TempNetAmountTickets  
  
SELECT ContestID,AgentNo INTO #TmpUnqCntAgntsTickets FROM #TempUnionAbsentAmountTickes  
WHERE ContestID IN (SELECT ContestID FROM tblContestMaster where Incentive_YorN='Y')  
GROUP BY ContestID,AgentNo  
  
--SELECT * FROM #TmpUnqCntAgntsTickets  
  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq,RuleName,DestId,NetTickets,(SELECT ISNULL(MAX(CycleCount),0)+1 FROM [tblTransactionTickets] AS TT WHERE TT.ContestID=RT.ContestID) AS CCT INTO #TUIO FROM #ResponseTableTempTickets AS RT 
WHERE EXISTS(SELECT ContestID FROM tblContestMaster AS tcm WHERE CMCounter>=2 AND RT.ContestID=tcm.ContestID) AND NOT EXISTS (SELECT AgentNo FROM #TmpUnqCntAgntsTickets AS TUQ WHERE TUQ.ContestID=RT.ContestID AND TUQ.AgentNo=RT.AgentNo)   
--SELECT * FROM #TUIO  
  
DECLARE TicketsLoop2run CURSOR  
FOR  
 SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq,RuleName,DestId,NetTickets,(SELECT ISNULL(MAX(CycleCount),0)+1 FROM [tblTransactionTickets] AS TT WHERE TT.ContestID=RT.ContestID) FROM #ResponseTableTempTickets AS RT WHERE EXISTS 
 (SELECT ContestID FROM tblContestMaster AS tcm WHERE CMCounter>=2 AND RT.ContestID=tcm.ContestID) AND NOT EXISTS (SELECT AgentNo FROM #TmpUnqCntAgntsTickets AS TUQ WHERE TUQ.ContestID=RT.ContestID AND TUQ.AgentNo=RT.AgentNo)   
OPEN TicketsLoop2run  
FETCH NEXT FROM TicketsLoop2run INTO @cid2,@contname2,@sd2,@ed2,@An2,@ld2,@s2,@rn2,@did2,@nt2,@CCT  
WHILE @@FETCH_STATUS = 0  
BEGIN  
 SET @Cycle_count=1  
 SET @Count_cycle = @CCT  
 SET @CountNewAgentNo = (SELECT COUNT(@An2) AS AgentNo FROM #ResponseTableTempTickets AS RTT WHERE NOT EXISTS (SELECT AgentNo FROM tblTransactionTickets AS TTT WHERE ValidFlag>0 AND @An2=TTT.AgentNo AND @cid2=TTT.ContestID) AND  EXISTS (SELECT ContestID FROM tblContestMaster AS TCM WHERE CMCounter>=2 AND @cid2=TCM.ContestID))  
 IF(@CountNewAgentNo=0)   
 BEGIN   
  SET @previousticketcount =(SELECT SUM(NetPayableTickes) FROM tblTransactionTickets WHERE ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2)  
  IF(@previousticketcount IS NULL)  
  BEGIN  
  SET @previousticketcount=0  
  END  
  SET @currentticketcount = @nt2  
   
  --PRINT 'Ticket Count'  
  --PRINT @previousticketcount  
  --PRINT @currentticketcount  
   
 IF(@currentticketcount>@previousticketcount)  
 BEGIN  
   --PRINT 'Current Greater'  
   IF(@previousticketcount>=1)  
   BEGIN  
     SET @diffctc_ptcgrt = (@currentticketcount-@previousticketcount)  
     SET @diff_G = @diffctc_ptcgrt  
       
     SET @CashNetValueTicket_G = (SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransac
tionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
     SET @CashNetRecoverdTickets_G = (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tb
lTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
     SET @TicketValueTicket_G = (SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransact
ionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
     SET @TicketNetRecoverdTickets_G = (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM 
tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
            
     SET @LoopCash_G = 1  
       
     IF(@CashNetRecoverdTickets_G>0 AND @TicketNetRecoverdTickets_G>0)  
     BEGIN  
     -- PRINT '1st'  
      WHILE(@LoopCash_G<=@diff_G)  
      BEGIN  
      --PRINT '2nd'  
       IF(@CashNetRecoverdTickets_G>0 AND @diffctc_ptcgrt>0)  
       BEGIN  
       --PRINT '3rd'  
       SET @CashValue_G = (@CashNetRecoverdTickets_G + @CashNetValueTicket_G)  
       SET @CashPayable_G = @CashNetRecoverdTickets_G  
       SET @diffctc_ptcgrt=@diffctc_ptcgrt-@CashNetRecoverdTickets_G  
       SET @CashNetRecoverdTickets_G = 0  
       END  
       IF(@TicketNetRecoverdTickets_G>0 AND @diffctc_ptcgrt>0)  
       BEGIN  
       --PRINT '4th'  
       SET @TicketValue_G = (@TicketNetRecoverdTickets_G + @TicketValueTicket_G)  
       SET @TicketPayable_G = @TicketNetRecoverdTickets_G  
       SET @diffctc_ptcgrt=@diffctc_ptcgrt-@TicketNetRecoverdTickets_G  
       SET @TicketNetRecoverdTickets_G = 0  
       END  
       SET @LoopCash_G=@LoopCash_G+1  
      END  
     END  
     ElSE  
     BEGIN  
     --PRINT '5th'  
     IF(@CashNetValueTicket_G<=0)  
     BEGIN  
     --PRINT '6th'  
      SET @CashValue_G = 0  
      SET @CashNetRecoverdTickets_G=0  
      SET @CashPayable_G=0  
     END  
     ELSE IF(@CashNetValueTicket_G>0)  
     BEGIN   
     --PRINT '7th'  
      SET @CashValue_G = (@diffctc_ptcgrt + @CashNetValueTicket_G)  
      SET @CashPayable_G = @diffctc_ptcgrt  
      SET @CashNetRecoverdTickets_G = 0  
      SET @diffctc_ptcgrt = @diffctc_ptcgrt - @CashPayable_G  
     END  
       
     IF(@TicketValueTicket_G<=0)  
     BEGIN  
     --PRINT '8th'  
      SET @TicketValue_G=0  
      SET @TicketNetRecoverdTickets_G=0  
      SET @TicketPayable_G =0  
     END  
     ELSE IF(@TicketValueTicket_G>0)  
     BEGIN  
     --PRINT '9th'  
      SET @TicketValue_G = (@diffctc_ptcgrt+@TicketValueTicket_G)  
      SET @TicketPayable_G = @diffctc_ptcgrt  
      SET @TicketNetRecoverdTickets_G =0  
      SET @diffctc_ptcgrt = @diffctc_ptcgrt-@TicketPayable_G  
     END  
       
     --IF(@CashNetValueTicket_G>0 AND @TicketValueTicket_G>0)  
     --BEGIN  
     --PRINT '10th'  
     -- SET @CashValue_G = (@diffctc_ptcgrt + @CashNetValueTicket_G)  
     -- SET @CashNetRecoverdTickets_G = 0  
     -- SET @CashPayable_G = @diffctc_ptcgrt  
     --END  
     END  
      
     SET  @netvaluegrt = (@TicketPayable_G * (SELECT tripAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
     SET @netpayablegrt = @netvaluegrt  
       
     INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
     VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),1,@netvaluegrt,@netpayablegrt,@previouspaidgrt,0,'T',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@TicketValue_G,@TicketNetRecoverdTickets_G,@TicketPayable_G,@CCT)  
       
     SET @TicketValue_G=0  
     SET @TicketNetRecoverdTickets_G=0   
     SET @TicketPayable_G=0  
       
     SET @netvaluegrt = (@CashPayable_G * (SELECT cashAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
     SET @netpayablegrt = @netvaluegrt  
       
     INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
     VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),2,@netvaluegrt,@netpayablegrt,@previouspaidgrt,0,'C',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@CashValue_G,@CashNetRecoverdTickets_G,@CashPayable_G,@CCT)  
       
     SET @CashValue_G=0  
     SET @CashNetRecoverdTickets_G=0  
     SET @CashPayable_G=0  
  END   
  ELSE IF(@previousticketcount<=0)  
  BEGIN  
   --PRINT '11th'  
   SET  @netvaluegrt = (0 * (SELECT tripAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
   SET @netpayablegrt = @netvaluegrt  
       
   INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,
PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
   VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),1,@netvaluegrt,@netpayablegrt,@previouspaidgrt,0,'T',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,0,0,0,@CCT)  
     
   SET @netvaluegrt = (@currentticketcount * (SELECT cashAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
   SET @netpayablegrt = @netvaluegrt       
     
   INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,
PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
   VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),2,@netvaluegrt,@netpayablegrt,@previouspaidgrt,0,'C',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@currentticketcount,0,@currentticketcount,@CCT)  
  END   
 END  
 ELSE IF(@currentticketcount<@previousticketcount)  
 BEGIN  
   --PRINT 'Current Less'  
     
    SET @diffctc_ptcless  = (-1*(@currentticketcount-@previousticketcount))  
    SET @diffctc_ptcless_temp = @diffctc_ptcless  
    SET @CashNetValueTicket = (SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactio
nTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    SET @CNV = @CashNetValueTicket  
    SET @LoopCashValueTicket = 1  
      
    IF(@CashNetValueTicket!=0 AND @currentticketcount>0)  
    BEGIN  
      WHILE(@LoopCashValueTicket<=@CNV)  
      BEGIN  
       IF(@diffctc_ptcless>0)  
       BEGIN  
        IF(@CNV>@diffctc_ptcless)  
        BEGIN  
       SET @CashNetValueTicket = @CashNetValueTicket - 1  
         
       SET @Net_Value_Ticket_C=@CashNetValueTicket  
       SET @Net_Recoverd_Tickets_C=(@LoopCashValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT 
TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
       SET @Net_Payable_Tickes_C=(-1*@LoopCashValueTicket)    
        END   
         
        ELSE IF(@CNV<@diffctc_ptcless)  
        BEGIN  
       SET @CashNetValueTicket = @CashNetValueTicket - 1  
         
       SET @Net_Value_Ticket_C=@CashNetValueTicket  
       SET @Net_Recoverd_Tickets_C=(@LoopCashValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT 
TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
       SET @Net_Payable_Tickes_C=(-1*@LoopCashValueTicket)  
        END  
          
        ELSE IF(@CNV=@diffctc_ptcless)  
        BEGIN  
       SET @CashNetValueTicket = @CashNetValueTicket - 1  
         
       SET @Net_Value_Ticket_C=@CashNetValueTicket  
       SET @Net_Recoverd_Tickets_C=(@LoopCashValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT 
TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
       SET @Net_Payable_Tickes_C=(-1*@LoopCashValueTicket)  
        END  
       END  
        SET @diffctc_ptcless = @diffctc_ptcless-1   
     SET @LoopCashValueTicket = @LoopCashValueTicket+1  
      END  
     END  
     ELSE IF(@CashNetValueTicket=0 AND @currentticketcount>0)  
     BEGIN  
    SET @Net_Value_Ticket_C =(SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransaction
Tickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    SET @Net_Recoverd_Tickets_C =(SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTra
nsactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    SET @Net_Payable_Tickes_C = 0  
     END  
     ELSE IF(@currentticketcount=0)  
     BEGIN  
      SET @Net_Value_Ticket_C =0  
    SET @Net_Recoverd_Tickets_C =(SELECT NetRecoverdTickets + NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    SET @Net_Payable_Tickes_C = (-1)*(SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
     END  
      
    SET @TicketNetValueTicket =(SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    SET @TNVT = @TicketNetValueTicket  
    SET @LoopTicketNetValueTicket=1  
      
    IF(@currentticketcount>0)  
    BEGIN  
     IF(@diffctc_ptcless>0)  
     BEGIN  
      WHILE(@LoopTicketNetValueTicket<=@TNVT)  
      BEGIN  
       IF(@diffctc_ptcless>0)  
       BEGIN  
      IF(@TicketNetValueTicket>@diffctc_ptcless)  
      BEGIN  
       SET @TicketNetValueTicket = @TicketNetValueTicket -1  
         
       SET @Net_Value_Ticket_T = @TicketNetValueTicket  
       SET @Net_Recoverd_Tickets_T=(@LoopTicketNetValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
       SET @Net_Payable_Tickes_T = (-1*@LoopTicketNetValueTicket)  
      END  
        
      ELSE IF(@TicketNetValueTicket<@diffctc_ptcless)  
      BEGIN  
       SET @TicketNetValueTicket = @TicketNetValueTicket -1  
         
       SET @Net_Value_Ticket_T = @TicketNetValueTicket  
       SET @Net_Recoverd_Tickets_T=(@LoopTicketNetValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
       SET @Net_Payable_Tickes_T = (-1*@LoopTicketNetValueTicket)  
      END  
        
      ELSE IF(@TicketNetValueTicket=@diffctc_ptcless)  
      BEGIN  
       SET @TicketNetValueTicket = @TicketNetValueTicket -1  
         
       SET @Net_Value_Ticket_T = @TicketNetValueTicket  
       SET @Net_Recoverd_Tickets_T=(@LoopTicketNetValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
       SET @Net_Payable_Tickes_T = (-1*@LoopTicketNetValueTicket)  
      END  
       END  
       SET @diffctc_ptcless = @diffctc_ptcless-1  
       SET @LoopTicketNetValueTicket= @LoopTicketNetValueTicket+1  
      END  
     END  
     ELSE IF(@diffctc_ptcless<=0)  
     BEGIN  
    SET @Net_Value_Ticket_T=(SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionT
ickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    SET @Net_Recoverd_Tickets_T=(SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTran
sactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    SET @Net_Payable_Tickes_T =0  
     END  
    END  
    ELSE IF(@currentticketcount=0)  
    BEGIN  
   SET @Net_Value_Ticket_T=0  
   SET @Net_Recoverd_Tickets_T=(SELECT NetRecoverdTickets + NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
   SET @Net_Payable_Tickes_T =(-1)*(SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    END  
    
  SET @netvalueless = (@Net_Payable_Tickes_T *(SELECT tripAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
  SET @netpayableless =  @netvalueless  
    
  INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
  VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),1,@netvalueless,@netpayableless,@previouspaidless,0,'T',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@Net_Value_Ticket_T,@Net_Recoverd_Tickets_T,@Net_Payable_Tickes_T,@CCT)  
    
  SET @Net_Value_Ticket_T=0  
  SET @Net_Recoverd_Tickets_T=0  
  SET @Net_Payable_Tickes_T=0  
    
  SET @netvalueless = (@Net_Payable_Tickes_C *(SELECT cashAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
  SET @netpayableless =  @netvalueless  
    
  INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
  VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),2,@netvalueless,@netpayableless,@previouspaidless,0,'C',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@Net_Value_Ticket_C,@Net_Recoverd_Tickets_C,@Net_Payable_Tickes_C,@CCT)  
    
  SET @Net_Value_Ticket_C=0   
  SET @Net_Recoverd_Tickets_C=0  
  SET @Net_Payable_Tickes_C=0  
    
 END  
 ELSE IF(@currentticketcount=@previousticketcount)  
 BEGIN  
  --PRINT 'Equal'  
     
  SET @CashValue_E = (SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets 
WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
  SET @CashRecoverd_E = (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionT
ickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
  SET @CashPayable_E =0  
    
  SET @TicketValue_E = (SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTicket
s WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
  SET @TicketRecoverd_E = (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactio
nTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
  SET @TicketPayable_E=0  
    
  SET @netvalueequal = (@TicketPayable_E *(SELECT tripAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
  SET @netpayablerequal =  @netvalueequal  
     
  INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
  VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),1,@netvalueequal,@netpayablerequal,@previouspaidequal,0,'T',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@TicketValue_E,@TicketRecoverd_E,@TicketPayable_E,@CCT)  
    
  SET @TicketValue_E=0  
  SET @TicketRecoverd_E=0  
  SET @TicketPayable_E=0  
    
  SET @netvalueequal = (@CashPayable_E *(SELECT cashAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
  SET @netpayablerequal =  @netvalueequal  
    
  INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
  VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),2,@netvalueequal,@netpayablerequal,@previouspaidequal,0,'C',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-
@previousticketcount),@previousticketcount,@CashValue_E,@CashRecoverd_E,@CashPayable_E,@CCT)  
    
  SET @CashValue_E=0  
  SET @CashRecoverd_E=0  
  SET @CashPayable_E=0  
    
 END  
 END  
 ELSE IF(@CountNewAgentNo!=0)  
 BEGIN  
  DECLARE @CountofAgent FLOAT,@netcashamt FLOAT  
  --PRINT 'New Entry'  
     SET @CAgY = (SELECT COUNT(@An2) AS AgentNo FROM #ResponseTableTempTickets WHERE  NOT EXISTS (SELECT AgentNo FROM tblTransactionTickets AS TTT WHERE ValidFlag>0 AND @An2=TTT.AgentNo AND @cid2=TTT.ContestID) AND  EXISTS (SELECT ContestID FROM tblContestMaster AS TCM WHERE CMCounter>=2 AND @cid2=TCM.ContestID) AND  EXISTS (SELECT ContestID FROM tblContestMaster AS TCM WHERE Incentive_YorN='N' AND @cid2=TCM.ContestID))  
     --PRINT '@CAgY'  
     --PRINT @CAgY  
       
   SET @previousticketcount =(SELECT SUM(NetPayableTickes) FROM tblTransactionTickets WHERE ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2)  
   IF(@previousticketcount IS NULL)  
   BEGIN  
   SET @previousticketcount=0  
   END  
   SET @currentticketcount = @nt2  
       
     IF(@CAgY!=0)  
     BEGIN  
      SET @CountofAgent = (SELECT ISNULL(COUNT(RT.AgentNo),0) AS Agno FROM  #ResponseTableTempTickets AS RT  
      WHERE (EXISTS(SELECT * FROM tblTransactionCash AS TC WHERE TC.ContestID=RT.ContestID AND TC.AgentNo=@An2 AND TC.CycleCount=1)))  
        
     -- PRINT @CountofAgent  
        
      IF(@CountofAgent=0)  
   BEGIN  
    INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,CycleCount)  
    VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),0,0,0,'T',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@nt2,(@currentticketcount-@previousticketcount),0,@CCT)  
      
    INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,CycleCount)  
    VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),0,0,0,'C',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@nt2,(@currentticketcount-@previousticketcount),0,@CCT)  
   END  
   ELSE IF(@CountofAgent>0)  
   BEGIN  
    INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,NetPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,CycleCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes)  
    VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),1,0,0,0,0,'T',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@nt2,(@currentticketcount-@previousticketcount),0,@CCT,0,0,0)  
      
    SET @netcashamt = (@nt2*(SELECT cashAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
      
    INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,NetPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,CycleCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes)  
    VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),2,@netcashamt,@netcashamt,0,0,'C',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@nt2,(@currentticketcount-@previousticketcount),0,@CCT,@nt2,0,@nt2)  
   END  
  END  
  ELSE IF(@CAgY=0)  
  BEGIN  
   INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,CycleCount)  
   VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),1,0,-10,'T',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@nt2,(@currentticketcount-@previousticketcount),0,@CCT)  
    
   INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,CycleCount)  
   VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),2,0,-10,'C',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@nt2,(@currentticketcount-@previousticketcount),0,@CCT)  
  END  
 END  
 FETCH NEXT FROM TicketsLoop2run INTO @cid2,@contname2,@sd2,@ed2,@An2,@ld2,@s2,@rn2,@did2,@nt2,@CCT  
END  
CLOSE TicketsLoop2run  
DEALLOCATE TicketsLoop2run  
------------------------------------------------Counter 2 So on End-------------------------------------------------------------------  
  
SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq,RuleName,DestId,NetTickets,(SELECT ISNULL(MAX(CycleCount),0)+1 FROM [tblTransactionTickets] AS TT WHERE TT.ContestID=RT.ContestID) AS CCT INTO #RTYU  FROM #ResponseTableTempTickets AS RT 
WHERE  EXISTS(SELECT ContestID FROM tblContestMaster AS TCM WHERE CMCounter=2 AND Incentive_YorN='Y' AND RT.ContestID=TCM.ContestID) AND  EXISTS (SELECT AgentNo FROM #TmpUnqCntAgntsTickets AS TUC WHERE TUC.ContestID=RT.ContestID AND TUC.AgentNo=RT.AgentNo
)   
--SELECT * FROM #RTYU  
  
-------------------Incentive_YorN ='Y' AND Absent of Agentno in 1st Run AND Agentno currentticketcount in Zero Start-----------------------------------------  
IF(@Cycle_count=1)  
 BEGIN  
   DECLARE AdvanceTicketsLooprun CURSOR  
   FOR  
    SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq,RuleName,DestId,NetTickets,@Count_cycle FROM #ResponseTableTempTickets AS RT WHERE EXISTS (SELECT ContestID FROM tblContestMaster AS TCM WHERE CMCounter=2 AND Incentive_YorN='Y' AND RT.ContestID=TCM.ContestID) AND  EXISTS(SELECT AgentNo FROM #TmpUnqCntAgntsTickets AS TUQ WHERE TUQ.ContestID=RT.ContestID AND TUQ.AgentNo=RT.AgentNo)   
    --SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq,RuleName,DestId,NetTickets,(SELECT ISNULL(MAX(CycleCount),0)+1 FROM [tblTransactionTickets] AS TT WHERE TT.ContestID=RT.ContestID) FROM #ResponseTableTempTickets AS RT WHERE RT.ContestID IN(SELECT ContestID FROM tblContestMaster WHERE CMCounter=2 AND Incentive_YorN='Y') AND RT.AgentNo IN (SELECT AgentNo FROM tblTransactionTickets WHERE CycleCount=1 AND CurrTicketsCount=0) OR RT.AgentNo IN (SELECT TR.AgentNo FROM #ResponseTableTempTickets AS TR WHERE TR.AgentNo NOT IN (SELECT AgentNo FROM tblTransactionTickets WHERE CycleCount=1) AND ContestID IN (SELECT ContestID FROM tblContestMaster WHERE Incentive_YorN='Y'))  
   OPEN AdvanceTicketsLooprun  
   FETCH NEXT FROM AdvanceTicketsLooprun INTO @cid2,@contname2,@sd2,@ed2,@An2,@ld2,@s2,@rn2,@did2,@nt2,@CCT  
   WHILE @@FETCH_STATUS = 0  
   BEGIN  
    SET @Cycle_count=0  
    --PRINT 'ooh'  
    SET @currentticketcount = @nt2  
    SET @previousticketcount =(SELECT SUM(NetPayableTickes) FROM tblTransactionTickets WHERE ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND CycleCount>=1)  
     IF(@previousticketcount IS NULL)  
     BEGIN  
     SET @previousticketcount=0  
     END  
    --PRINT @currentticketcount  
    --PRINT @previousticketcount  
      
    IF(@currentticketcount>@previousticketcount)  
    BEGIN  
     --PRINT 'Greater Zero'  
     IF(@previousticketcount>=1)  
     BEGIN  
       SET @diffctc_ptcgrt = (@currentticketcount-@previousticketcount)  
       SET @diff_G = @diffctc_ptcgrt  
       --PRINT @diff_G  
         
       SET @CashNetValueTicket_G = (SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTrans
actionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
       --PRINT @CashNetValueTicket_G  
       SET @CashNetRecoverdTickets_G = (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM 
tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
       --PRINT @CashNetRecoverdTickets_G  
       SET @TicketValueTicket_G = (SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransa
ctionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
       --PRINT @TicketValueTicket_G  
       SET @TicketNetRecoverdTickets_G = (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
       --PRINT @TicketNetRecoverdTickets_G  
         
       SET @LoopCash_G = 1  
       IF(@CashNetRecoverdTickets_G>0 AND @TicketNetRecoverdTickets_G>0)  
       BEGIN  
       --PRINT '1st'  
         WHILE(@LoopCash_G<=@diff_G)  
         BEGIN  
         --PRINT '2nd'  
          IF(@CashNetRecoverdTickets_G>0 AND @diffctc_ptcgrt>0)  
          BEGIN  
          --PRINT '3rd'  
          SET @CashValue_G = (@CashNetRecoverdTickets_G + @CashNetValueTicket_G)  
          SET @CashPayable_G = @CashNetRecoverdTickets_G  
          SET @diffctc_ptcgrt=@diffctc_ptcgrt-@CashNetRecoverdTickets_G  
          SET @CashNetRecoverdTickets_G = 0  
          END  
          IF(@TicketNetRecoverdTickets_G>0 AND @diffctc_ptcgrt>0)  
          BEGIN  
          --PRINT '4th'  
          SET @TicketValue_G = (@TicketNetRecoverdTickets_G + @TicketValueTicket_G)  
          SET @TicketPayable_G = @TicketNetRecoverdTickets_G  
          SET @diffctc_ptcgrt=@diffctc_ptcgrt-@TicketNetRecoverdTickets_G  
          SET @TicketNetRecoverdTickets_G = 0  
          END  
          SET @LoopCash_G=@LoopCash_G+1  
         END  
        END  
        ELSE  
        BEGIN  
       --PRINT '5th'  
        IF(@CashNetValueTicket_G<=0)  
        BEGIN  
        --PRINT '6th'  
         SET @CashValue_G = 0  
         SET @CashNetRecoverdTickets_G=0  
         SET @CashPayable_G=0  
        END  
        ELSE IF(@CashNetValueTicket_G>0)  
        BEGIN   
        --PRINT '7th'  
         SET @CashValue_G = (@CashNetValueTicket_G)  
         SET @CashPayable_G = 0 --@diffctc_ptcgrt  
         SET @CashNetRecoverdTickets_G = 0  
         SET @diffctc_ptcgrt = @diffctc_ptcgrt - @CashPayable_G  
        END  
          
        IF(@TicketValueTicket_G<=0)  
        BEGIN  
        --PRINT '8th'  
         SET @TicketValue_G=0  
         SET @TicketNetRecoverdTickets_G=0  
         SET @TicketPayable_G =0  
        END  
        ELSE IF(@TicketValueTicket_G>0)  
        BEGIN  
        --PRINT '9th'  
         SET @TicketValue_G = (@TicketValueTicket_G)  
         SET @TicketPayable_G = 0 --@diffctc_ptcgrt  
         SET @TicketNetRecoverdTickets_G =0  
         SET @diffctc_ptcgrt = @diffctc_ptcgrt-@TicketPayable_G  
        END  
        END  
        SET  @netvaluegrt = (@TicketPayable_G * (SELECT tripAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
        SET @netpayablegrt = @netvaluegrt  
             
        INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
        VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),1,@netvaluegrt,@netpayablegrt,@previouspaidgrt,-10,'T',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@TicketValue_G,@TicketNetRecoverdTickets_G,@TicketPayable_G,@CCT)  
          
        SET @netvaluegrt = (@CashPayable_G * (SELECT cashAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
        SET @netpayablegrt = @netvaluegrt  
          
        INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
        VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),2,@netvaluegrt,@netpayablegrt,@previouspaidgrt,-10,'C',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@CashValue_G,@CashNetRecoverdTickets_G,@CashPayable_G,@CCT)  
     END  
     ELSE IF(@previousticketcount<=0)  
     BEGIN  
      --PRINT '11th'  
      SET  @netvaluegrt = NULL  
      SET @netpayablegrt = @netvaluegrt  
          
      INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
      VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),1,@netvaluegrt,@netpayablegrt,@previouspaidgrt,-10,'T',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,NULL,NULL,NULL,@CCT)  
        
      SET @netvaluegrt =  NULL   
      SET @netpayablegrt = @netvaluegrt       
        
      INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
      VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),2,@netvaluegrt,@netpayablegrt,@previouspaidgrt,-10,'C',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,NULL,NULL,NULL,@CCT)  
     END   
       
    END  
    ELSE IF(@currentticketcount<@previousticketcount)  
    BEGIN  
     --PRINT 'Less Zero'  
       SET @diffctc_ptcless  = (-1*(@currentticketcount-@previousticketcount))  
       SET @diffctc_ptcless_temp = @diffctc_ptcless  
       SET @CashNetValueTicket = (SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransac
tionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
       SET @CNV = @CashNetValueTicket  
       SET @LoopCashValueTicket = 1  
         
       IF(@CashNetValueTicket!=0 AND @currentticketcount>0)  
       BEGIN  
         --PRINT '1st'   
         WHILE(@LoopCashValueTicket<=@CNV)  
         BEGIN  
          IF(@diffctc_ptcless>0)  
          BEGIN  
           IF(@CNV>@diffctc_ptcless)  
           BEGIN  
         --PRINT '2nd'  
          SET @CashNetValueTicket = @CashNetValueTicket - 1  
            
          SET @Net_Value_Ticket_C=@CashNetValueTicket  
          SET @Net_Recoverd_Tickets_C=(@LoopCashValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
          SET @Net_Payable_Tickes_C=(-1*@LoopCashValueTicket)    
           END   
            
           ELSE IF(@CNV<@diffctc_ptcless)  
           BEGIN  
          -- PRINT '3nd'  
          SET @CashNetValueTicket = @CashNetValueTicket - 1  
            
          SET @Net_Value_Ticket_C=@CashNetValueTicket  
          SET @Net_Recoverd_Tickets_C=(@LoopCashValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
          SET @Net_Payable_Tickes_C=(-1*@LoopCashValueTicket)  
           END  
             
           ELSE IF(@CNV=@diffctc_ptcless)  
           BEGIN  
           --PRINT '4nd'  
          SET @CashNetValueTicket = @CashNetValueTicket - 1  
            
          SET @Net_Value_Ticket_C=@CashNetValueTicket  
          SET @Net_Recoverd_Tickets_C=(@LoopCashValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
          SET @Net_Payable_Tickes_C=(-1*@LoopCashValueTicket)  
           END  
          END  
        SET @diffctc_ptcless = @diffctc_ptcless-1   
        SET @LoopCashValueTicket = @LoopCashValueTicket+1  
         END  
        END  
        ELSE IF(@CashNetValueTicket=0 AND @currentticketcount>0)  
        BEGIN  
        --PRINT '5nd'  
       SET @Net_Value_Ticket_C =(SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransact
ionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
       SET @Net_Recoverd_Tickets_C =(SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tbl
TransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
       SET @Net_Payable_Tickes_C = 0  
        END  
        ELSE IF(@currentticketcount=0)  
        BEGIN  
        --PRINT '6nd'  
         SET @Net_Value_Ticket_C =0  
       SET @Net_Recoverd_Tickets_C =(SELECT NetRecoverdTickets + NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 
LoadDate FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
       SET @Net_Payable_Tickes_C = (-1)*(SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tbl
TransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
        END  
         
       SET @TicketNetValueTicket =(SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransa
ctionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
       SET @TNVT = @TicketNetValueTicket  
       SET @LoopTicketNetValueTicket=1  
         
       IF(@currentticketcount>0)  
       BEGIN  
       --PRINT '7nd'  
        IF(@diffctc_ptcless>0)  
        BEGIN  
         WHILE(@LoopTicketNetValueTicket<=@TNVT)  
         BEGIN  
         --PRINT '8nd'  
          IF(@diffctc_ptcless>0)  
          BEGIN  
         IF(@TicketNetValueTicket>@diffctc_ptcless)  
         BEGIN  
         --PRINT '9nd'  
          SET @TicketNetValueTicket = @TicketNetValueTicket -1  
            
          SET @Net_Value_Ticket_T = @TicketNetValueTicket  
          SET @Net_Recoverd_Tickets_T=(@LoopTicketNetValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=
(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
          SET @Net_Payable_Tickes_T = (-1*@LoopTicketNetValueTicket)  
         END  
           
         ELSE IF(@TicketNetValueTicket<@diffctc_ptcless)  
         BEGIN  
         --PRINT '10nd'  
          SET @TicketNetValueTicket = @TicketNetValueTicket -1  
            
          SET @Net_Value_Ticket_T = @TicketNetValueTicket  
          SET @Net_Recoverd_Tickets_T=(@LoopTicketNetValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=
(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
          SET @Net_Payable_Tickes_T = (-1*@LoopTicketNetValueTicket)  
         END  
           
         ELSE IF(@TicketNetValueTicket=@diffctc_ptcless)  
         BEGIN  
         --PRINT '11nd'  
          SET @TicketNetValueTicket = @TicketNetValueTicket -1  
            
          SET @Net_Value_Ticket_T = @TicketNetValueTicket  
          SET @Net_Recoverd_Tickets_T=(@LoopTicketNetValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=
(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
          SET @Net_Payable_Tickes_T = (-1*@LoopTicketNetValueTicket)  
         END  
          END  
          SET @diffctc_ptcless = @diffctc_ptcless-1  
          SET @LoopTicketNetValueTicket= @LoopTicketNetValueTicket+1  
         END  
        END  
        ELSE IF(@diffctc_ptcless<=0)  
        BEGIN  
        --PRINT '12nd'  
       SET @Net_Value_Ticket_T=(SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransacti
onTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
       SET @Net_Recoverd_Tickets_T=(SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblT
ransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
       SET @Net_Payable_Tickes_T =0  
        END  
       END  
       ELSE IF(@currentticketcount=0)  
       BEGIN  
       --PRINT '13nd'  
      SET @Net_Value_Ticket_T=0  
      SET @Net_Recoverd_Tickets_T=(SELECT NetRecoverdTickets + NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
      SET @Net_Payable_Tickes_T =(-1)*(SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
       END  
       
     SET @netvalueless = (@Net_Payable_Tickes_T *(SELECT tripAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
     SET @netpayableless =  @netvalueless  
       
     INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
     VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),1,@netvalueless,@netpayableless,@previouspaidless,0,'T',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@Net_Value_Ticket_T,@Net_Recoverd_Tickets_T,@Net_Payable_Tickes_T,@CCT)  
       
     SET @netvalueless = (@Net_Payable_Tickes_C *(SELECT cashAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
     SET @netpayableless =  @netvalueless  
       
     INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
     VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),2,@netvalueless,@netpayableless,@previouspaidless,0,'C',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@Net_Value_Ticket_C,@Net_Recoverd_Tickets_C,@Net_Payable_Tickes_C,@CCT)  
    END  
    ELSE IF(@currentticketcount=@previousticketcount)  
    BEGIN  
     --PRINT 'Equal Zero'  
       
     SET @CashValue_E = (SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTicke
ts WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
     SET @CashRecoverd_E = (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransacti
onTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
     SET @CashPayable_E =0  
       
     SET @TicketValue_E = (SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTic
kets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
     SET @TicketRecoverd_E = (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransac
tionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
     SET @TicketPayable_E=0  
       
     SET @netvalueequal = (@TicketPayable_E *(SELECT tripAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
     SET @netpayablerequal =  @netvalueequal  
        
     INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
     VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),1,@netvalueequal,@netpayablerequal,@previouspaidequal,0,'T',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@TicketValue_E,@TicketRecoverd_E,@TicketPayable_E,@CCT)  
       
     SET @netvalueequal = (@CashPayable_E *(SELECT cashAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
     SET @netpayablerequal =  @netvalueequal  
       
     INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
     VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),2,@netvalueequal,@netpayablerequal,@previouspaidequal,0,'C',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@CashValue_E,@CashRecoverd_E,@CashPayable_E,@CCT)  
       
    END  
    FETCH NEXT FROM AdvanceTicketsLooprun INTO @cid2,@contname2,@sd2,@ed2,@An2,@ld2,@s2,@rn2,@did2,@nt2,@CCT  
   END  
   CLOSE AdvanceTicketsLooprun  
   DEALLOCATE AdvanceTicketsLooprun  
END  
ELSE  
BEGIN  
  DECLARE AdvanceTicketsLooprun CURSOR  
  FOR  
   SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq,RuleName,DestId,NetTickets,(SELECT ISNULL(MAX(CycleCount),0)+1 FROM [tblTransactionTickets] AS TT WHERE TT.ContestID=RT.ContestID) FROM #ResponseTableTempTickets AS RT WHERE  EXISTS(SELECT ContestID FROM tblContestMaster AS tcm WHERE CMCounter=2 AND Incentive_YorN='Y' AND RT.ContestID=tcm.ContestID) AND  EXISTS (SELECT AgentNo FROM #TmpUnqCntAgntsTickets AS TUQ WHERE TUQ.ContestID=RT.ContestID AND TUQ.AgentNo=RT.AgentNo)   
   --SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq,RuleName,DestId,NetTickets,(SELECT ISNULL(MAX(CycleCount),0)+1 FROM [tblTransactionTickets] AS TT WHERE TT.ContestID=RT.ContestID) FROM #ResponseTableTempTickets AS RT WHERE RT.ContestID IN(SELECT ContestID FROM tblContestMaster WHERE CMCounter=2 AND Incentive_YorN='Y') AND RT.AgentNo IN (SELECT AgentNo FROM tblTransactionTickets WHERE CycleCount=1 AND CurrTicketsCount=0) OR RT.AgentNo IN (SELECT TR.AgentNo FROM #ResponseTableTempTickets AS TR WHERE TR.AgentNo NOT IN (SELECT AgentNo FROM tblTransactionTickets WHERE CycleCount=1) AND ContestID IN (SELECT ContestID FROM tblContestMaster WHERE Incentive_YorN='Y'))  
  OPEN AdvanceTicketsLooprun  
  FETCH NEXT FROM AdvanceTicketsLooprun INTO @cid2,@contname2,@sd2,@ed2,@An2,@ld2,@s2,@rn2,@did2,@nt2,@CCT  
  WHILE @@FETCH_STATUS = 0  
  BEGIN  
   --PRINT 'ooh'  
   SET @currentticketcount = @nt2  
   SET @previousticketcount =(SELECT SUM(NetPayableTickes) FROM tblTransactionTickets WHERE ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND CycleCount>=1)  
    IF(@previousticketcount IS NULL)  
    BEGIN  
    SET @previousticketcount=0  
    END  
   --PRINT @currentticketcount  
   --PRINT @previousticketcount  
     
   IF(@currentticketcount>@previousticketcount)  
   BEGIN  
    --PRINT 'Greater Zero'  
    IF(@previousticketcount>=1)  
    BEGIN  
      SET @diffctc_ptcgrt = (@currentticketcount-@previousticketcount)  
      SET @diff_G = @diffctc_ptcgrt  
      --PRINT @diff_G  
        
      SET @CashNetValueTicket_G = (SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransa
ctionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
      --PRINT @CashNetValueTicket_G  
      SET @CashNetRecoverdTickets_G = (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM t
blTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
      --PRINT @CashNetRecoverdTickets_G  
      SET @TicketValueTicket_G = (SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransac
tionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
      --PRINT @TicketValueTicket_G  
      SET @TicketNetRecoverdTickets_G = (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM
 tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
      --PRINT @TicketNetRecoverdTickets_G  
        
      SET @LoopCash_G = 1  
      IF(@CashNetRecoverdTickets_G>0 AND @TicketNetRecoverdTickets_G>0)  
      BEGIN  
      --PRINT '1st'  
        WHILE(@LoopCash_G<=@diff_G)  
        BEGIN  
        --PRINT '2nd'  
         IF(@CashNetRecoverdTickets_G>0 AND @diffctc_ptcgrt>0)  
         BEGIN  
         --PRINT '3rd'  
         SET @CashValue_G = (@CashNetRecoverdTickets_G + @CashNetValueTicket_G)  
         SET @CashPayable_G = @CashNetRecoverdTickets_G  
         SET @diffctc_ptcgrt=@diffctc_ptcgrt-@CashNetRecoverdTickets_G  
         SET @CashNetRecoverdTickets_G = 0  
         END  
         IF(@TicketNetRecoverdTickets_G>0 AND @diffctc_ptcgrt>0)  
         BEGIN  
         --PRINT '4th'  
         SET @TicketValue_G = (@TicketNetRecoverdTickets_G + @TicketValueTicket_G)  
         SET @TicketPayable_G = @TicketNetRecoverdTickets_G  
         SET @diffctc_ptcgrt=@diffctc_ptcgrt-@TicketNetRecoverdTickets_G  
         SET @TicketNetRecoverdTickets_G = 0  
         END  
         SET @LoopCash_G=@LoopCash_G+1  
        END  
       END  
       ELSE  
       BEGIN  
      --PRINT '5th'  
       IF(@CashNetValueTicket_G<=0)  
       BEGIN  
       --PRINT '6th'  
        SET @CashValue_G = 0  
        SET @CashNetRecoverdTickets_G=0  
        SET @CashPayable_G=0  
       END  
       ELSE IF(@CashNetValueTicket_G>0)  
       BEGIN   
       --PRINT '7th'  
        SET @CashValue_G = (@CashNetValueTicket_G)  
        SET @CashPayable_G = 0 --@diffctc_ptcgrt  
        SET @CashNetRecoverdTickets_G = 0  
        SET @diffctc_ptcgrt = @diffctc_ptcgrt - @CashPayable_G  
       END  
         
       IF(@TicketValueTicket_G<=0)  
       BEGIN  
       --PRINT '8th'  
        SET @TicketValue_G=0  
        SET @TicketNetRecoverdTickets_G=0  
        SET @TicketPayable_G =0  
       END  
       ELSE IF(@TicketValueTicket_G>0)  
       BEGIN  
       --PRINT '9th'  
        SET @TicketValue_G = (@TicketValueTicket_G)  
        SET @TicketPayable_G = 0 --@diffctc_ptcgrt  
        SET @TicketNetRecoverdTickets_G =0  
        SET @diffctc_ptcgrt = @diffctc_ptcgrt-@TicketPayable_G  
       END  
       END  
       SET  @netvaluegrt = (@TicketPayable_G * (SELECT tripAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
       SET @netpayablegrt = @netvaluegrt  
            
       INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
       VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),1,@netvaluegrt,@netpayablegrt,@previouspaidgrt,-10,'T',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-
@previousticketcount),@previousticketcount,@TicketValue_G,@TicketNetRecoverdTickets_G,@TicketPayable_G,@CCT)  
         
       SET @netvaluegrt = (@CashPayable_G * (SELECT cashAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
       SET @netpayablegrt = @netvaluegrt  
         
       INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
       VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),2,@netvaluegrt,@netpayablegrt,@previouspaidgrt,-10,'C',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@CashValue_G,@CashNetRecoverdTickets_G,@CashPayable_G,@CCT)  
    END  
    ELSE IF(@previousticketcount<=0)  
    BEGIN  
     --PRINT '11th'  
     SET  @netvaluegrt = NULL  
     SET @netpayablegrt = @netvaluegrt  
         
     INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
     VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),1,@netvaluegrt,@netpayablegrt,@previouspaidgrt,-10,'T',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,NULL,NULL,NULL,@CCT)  
       
     SET @netvaluegrt =  NULL   
     SET @netpayablegrt = @netvaluegrt       
       
     INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
     VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),2,@netvaluegrt,@netpayablegrt,@previouspaidgrt,-10,'C',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,NULL,NULL,NULL,@CCT)  
    END   
      
   END  
   ELSE IF(@currentticketcount<@previousticketcount)  
   BEGIN  
    --PRINT 'Less Zero'  
      SET @diffctc_ptcless  = (-1*(@currentticketcount-@previousticketcount))  
      SET @diffctc_ptcless_temp = @diffctc_ptcless  
      SET @CashNetValueTicket = (SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransact
ionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
      SET @CNV = @CashNetValueTicket  
      SET @LoopCashValueTicket = 1  
        
      IF(@CashNetValueTicket!=0 AND @currentticketcount>0)  
      BEGIN  
        --PRINT '1st'   
        WHILE(@LoopCashValueTicket<=@CNV)  
        BEGIN  
         IF(@diffctc_ptcless>0)  
         BEGIN  
          IF(@CNV>@diffctc_ptcless)  
          BEGIN  
        --PRINT '2nd'  
         SET @CashNetValueTicket = @CashNetValueTicket - 1  
           
         SET @Net_Value_Ticket_C=@CashNetValueTicket  
         SET @Net_Recoverd_Tickets_C=(@LoopCashValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
         SET @Net_Payable_Tickes_C=(-1*@LoopCashValueTicket)    
          END   
           
          ELSE IF(@CNV<@diffctc_ptcless)  
          BEGIN  
          --PRINT '3nd'  
         SET @CashNetValueTicket = @CashNetValueTicket - 1  
           
         SET @Net_Value_Ticket_C=@CashNetValueTicket  
         SET @Net_Recoverd_Tickets_C=(@LoopCashValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
         SET @Net_Payable_Tickes_C=(-1*@LoopCashValueTicket)  
          END  
            
          ELSE IF(@CNV=@diffctc_ptcless)  
          BEGIN  
          --PRINT '4nd'  
         SET @CashNetValueTicket = @CashNetValueTicket - 1  
           
         SET @Net_Value_Ticket_C=@CashNetValueTicket  
         SET @Net_Recoverd_Tickets_C=(@LoopCashValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
         SET @Net_Payable_Tickes_C=(-1*@LoopCashValueTicket)  
          END  
         END  
       SET @diffctc_ptcless = @diffctc_ptcless-1   
       SET @LoopCashValueTicket = @LoopCashValueTicket+1  
        END  
       END  
       ELSE IF(@CashNetValueTicket=0 AND @currentticketcount>0)  
       BEGIN  
       --PRINT '5nd'  
      SET @Net_Value_Ticket_C =(SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransacti
onTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
      SET @Net_Recoverd_Tickets_C =(SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblT
ransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
      SET @Net_Payable_Tickes_C = 0  
       END  
       ELSE IF(@currentticketcount=0)  
       BEGIN  
       --PRINT '6nd'  
        SET @Net_Value_Ticket_C =0  
      SET @Net_Recoverd_Tickets_C =(SELECT NetRecoverdTickets + NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
      SET @Net_Payable_Tickes_C = (-1)*(SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
       END  
        
      SET @TicketNetValueTicket =(SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
      SET @TNVT = @TicketNetValueTicket  
      SET @LoopTicketNetValueTicket=1  
        
      IF(@currentticketcount>0)  
      BEGIN  
      --PRINT '7nd'  
       IF(@diffctc_ptcless>0)  
       BEGIN  
        WHILE(@LoopTicketNetValueTicket<=@TNVT)  
        BEGIN  
        --PRINT '8nd'  
         IF(@diffctc_ptcless>0)  
         BEGIN  
        IF(@TicketNetValueTicket>@diffctc_ptcless)  
        BEGIN  
        --PRINT '9nd'  
         SET @TicketNetValueTicket = @TicketNetValueTicket -1  
           
         SET @Net_Value_Ticket_T = @TicketNetValueTicket  
         SET @Net_Recoverd_Tickets_T=(@LoopTicketNetValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(
SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
         SET @Net_Payable_Tickes_T = (-1*@LoopTicketNetValueTicket)  
        END  
          
        ELSE IF(@TicketNetValueTicket<@diffctc_ptcless)  
        BEGIN  
        --PRINT '10nd'  
         SET @TicketNetValueTicket = @TicketNetValueTicket -1  
           
         SET @Net_Value_Ticket_T = @TicketNetValueTicket  
         SET @Net_Recoverd_Tickets_T=(@LoopTicketNetValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(
SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
         SET @Net_Payable_Tickes_T = (-1*@LoopTicketNetValueTicket)  
        END  
          
        ELSE IF(@TicketNetValueTicket=@diffctc_ptcless)  
        BEGIN  
        --PRINT '11nd'  
         SET @TicketNetValueTicket = @TicketNetValueTicket -1  
           
         SET @Net_Value_Ticket_T = @TicketNetValueTicket  
         SET @Net_Recoverd_Tickets_T=(@LoopTicketNetValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(
SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
         SET @Net_Payable_Tickes_T = (-1*@LoopTicketNetValueTicket)  
        END  
         END  
         SET @diffctc_ptcless = @diffctc_ptcless-1  
         SET @LoopTicketNetValueTicket= @LoopTicketNetValueTicket+1  
        END  
       END  
       ELSE IF(@diffctc_ptcless<=0)  
       BEGIN  
       --PRINT '12nd'  
      SET @Net_Value_Ticket_T=(SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactio
nTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
      SET @Net_Recoverd_Tickets_T=(SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTr
ansactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
      SET @Net_Payable_Tickes_T =0  
       END  
      END  
      ELSE IF(@currentticketcount=0)  
      BEGIN  
      --PRINT '13nd'  
     SET @Net_Value_Ticket_T=0  
     SET @Net_Recoverd_Tickets_T=(SELECT NetRecoverdTickets + NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
     SET @Net_Payable_Tickes_T =(-1)*(SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
      END  
      
    SET @netvalueless = (@Net_Payable_Tickes_T *(SELECT tripAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
    SET @netpayableless =  @netvalueless  
      
    INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets
,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
    VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),1,@netvalueless,@netpayableless,@previouspaidless,0,'T',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@Net_Value_Ticket_T,@Net_Recoverd_Tickets_T,@Net_Payable_Tickes_T,@CCT)  
      
    SET @netvalueless = (@Net_Payable_Tickes_C *(SELECT cashAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
    SET @netpayableless =  @netvalueless  
      
    INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets
,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
    VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),2,@netvalueless,@netpayableless,@previouspaidless,0,'C',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@Net_Value_Ticket_C,@Net_Recoverd_Tickets_C,@Net_Payable_Tickes_C,@CCT)  
   END  
   ELSE IF(@currentticketcount=@previousticketcount)  
   BEGIN  
    --PRINT 'Equal Zero'  
      
    SET @CashValue_E = (SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTicket
s WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    SET @CashRecoverd_E = (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactio
nTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    SET @CashPayable_E =0  
      
    SET @TicketValue_E = (SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTick
ets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    SET @TicketRecoverd_E = (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransact
ionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    SET @TicketPayable_E=0  
      
    SET @netvalueequal = (@TicketPayable_E *(SELECT tripAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
    SET @netpayablerequal =  @netvalueequal  
       
    INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets
,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
    VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),1,@netvalueequal,@netpayablerequal,@previouspaidequal,0,'T',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@TicketValue_E,@TicketRecoverd_E,@TicketPayable_E,@CCT)  
      
    SET @netvalueequal = (@CashPayable_E *(SELECT cashAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
    SET @netpayablerequal =  @netvalueequal  
      
    INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets
,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
    VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),2,@netvalueequal,@netpayablerequal,@previouspaidequal,0,'C',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@CashValue_E,@CashRecoverd_E,@CashPayable_E,@CCT)  
      
   END  
   FETCH NEXT FROM AdvanceTicketsLooprun INTO @cid2,@contname2,@sd2,@ed2,@An2,@ld2,@s2,@rn2,@did2,@nt2,@CCT  
  END  
  CLOSE AdvanceTicketsLooprun  
  DEALLOCATE AdvanceTicketsLooprun  
END  
-----------------Incentive_YorN ='Y' AND Absent of Agentno in 1st Run AND Agentno currentticketcount in Zero Start-----------------------------------------  
  
  
-----------------------------------------------CMCounter 1 AND Advancecounter -1 Run Start---------------------------------------------  
DECLARE @CStatus INT,@TStatus INT  
  
DECLARE AdvanceTicketsLooprun CURSOR  
FOR  
 SELECT ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Seq,RuleName,DestId,NetTickets,(SELECT ISNULL(MAX(CycleCount),0)+1 FROM [tblTransactionTickets] AS TT WHERE TT.ContestID=RT.ContestID) FROM #ResponseTableTempTickets AS RT WHERE  EXISTS(SELECT ContestID FROM tblContestMaster AS tcm WHERE CMCounter=1 AND Advancecounter=-1 AND RT.ContestID=tcm.ContestID)   
OPEN AdvanceTicketsLooprun  
FETCH NEXT FROM AdvanceTicketsLooprun INTO @cid2,@contname2,@sd2,@ed2,@An2,@ld2,@s2,@rn2,@did2,@nt2,@CCT  
WHILE @@FETCH_STATUS = 0  
BEGIN  
 --PRINT 'ooh'  
 SET @currentticketcount = @nt2  
 SET @previousticketcount =(SELECT SUM(NetPayableTickes) FROM tblTransactionTickets WHERE ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2)  
  IF(@previousticketcount IS NULL)  
  BEGIN  
  SET @previousticketcount=0  
  END  
 PRINT @currentticketcount  
 PRINT @previousticketcount  
   
 IF(@currentticketcount>@previousticketcount)  
 BEGIN  
  --PRINT 'Greater Zero'  
  IF(@previousticketcount>=1)  
  BEGIN  
    SET @diffctc_ptcgrt = (@currentticketcount-@previousticketcount)  
    SET @diff_G = @diffctc_ptcgrt  
    --PRINT @diff_G  
      
    SET @CashNetValueTicket_G = (SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransact
ionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    --PRINT @CashNetValueTicket_G  
    SET @CashNetRecoverdTickets_G = (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tbl
TransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    --PRINT @CashNetRecoverdTickets_G  
    SET @TicketValueTicket_G = (SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransacti
onTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    --PRINT @TicketValueTicket_G  
    SET @TicketNetRecoverdTickets_G = (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM t
blTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    --PRINT @TicketNetRecoverdTickets_G  
      
    SET @LoopCash_G = 1  
    IF(@CashNetRecoverdTickets_G>0 AND @TicketNetRecoverdTickets_G>0)  
    BEGIN  
    --PRINT '1st'  
      WHILE(@LoopCash_G<=@diff_G)  
      BEGIN  
      --PRINT '2nd'  
       IF(@CashNetRecoverdTickets_G>0 AND @diffctc_ptcgrt>0)  
       BEGIN  
       --PRINT '3rd'  
       SET @CashValue_G = (@CashNetRecoverdTickets_G + @CashNetValueTicket_G)  
       SET @CashPayable_G = @CashNetRecoverdTickets_G  
       SET @diffctc_ptcgrt=@diffctc_ptcgrt-@CashNetRecoverdTickets_G  
       SET @CashNetRecoverdTickets_G = 0  
       END  
       IF(@TicketNetRecoverdTickets_G>0 AND @diffctc_ptcgrt>0)  
       BEGIN  
       --PRINT '4th'  
       SET @TicketValue_G = (@TicketNetRecoverdTickets_G + @TicketValueTicket_G)  
       SET @TicketPayable_G = @TicketNetRecoverdTickets_G  
       SET @diffctc_ptcgrt=@diffctc_ptcgrt-@TicketNetRecoverdTickets_G  
       SET @TicketNetRecoverdTickets_G = 0  
       END  
       SET @LoopCash_G=@LoopCash_G+1  
      END  
     END  
     ELSE  
     BEGIN  
    --PRINT '5th'  
     IF(@CashNetValueTicket_G<=0)  
     BEGIN  
     --PRINT '6th'  
      SET @CashValue_G = 0  
      SET @CashNetRecoverdTickets_G=0  
      SET @CashPayable_G=0  
     END  
     ELSE IF(@CashNetValueTicket_G>0)  
     BEGIN   
     --PRINT '7th'  
      SET @CashValue_G = (@CashNetValueTicket_G)  
      SET @CashPayable_G = 0 --@diffctc_ptcgrt  
      SET @CashNetRecoverdTickets_G = 0  
      SET @diffctc_ptcgrt = @diffctc_ptcgrt - @CashPayable_G  
     END  
       
     IF(@TicketValueTicket_G<=0)  
     BEGIN  
     --PRINT '8th'  
      SET @TicketValue_G=0  
      SET @TicketNetRecoverdTickets_G=0  
      SET @TicketPayable_G =0  
     END  
     ELSE IF(@TicketValueTicket_G>0)  
     BEGIN  
     --PRINT '9th'  
      SET @TicketValue_G = (@TicketValueTicket_G)  
      SET @TicketPayable_G = 0 --@diffctc_ptcgrt  
      SET @TicketNetRecoverdTickets_G =0  
      SET @diffctc_ptcgrt = @diffctc_ptcgrt-@TicketPayable_G  
     END  
     END  
        SET  @netvaluegrt = (@TicketPayable_G * (SELECT tripAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
     SET @netpayablegrt = @netvaluegrt  
          
     INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
     VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),1,@netvaluegrt,@netpayablegrt,@previouspaidgrt,-10,'T',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@TicketValue_G,@TicketNetRecoverdTickets_G,@TicketPayable_G,@CCT)  
       
     SET @netvaluegrt = (@CashPayable_G * (SELECT cashAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
     SET @netpayablegrt = @netvaluegrt  
       
     INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
     VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),2,@netvaluegrt,@netpayablegrt,@previouspaidgrt,-10,'C',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@CashValue_G,@CashNetRecoverdTickets_G,@CashPayable_G,@CCT)  
  END  
  ELSE IF(@previousticketcount<=0)  
  BEGIN  
   --PRINT '11th'  
   SET  @netvaluegrt = NULL  
   SET @netpayablegrt = @netvaluegrt  
       
   INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,
PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
   VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),1,@netvaluegrt,@netpayablegrt,@previouspaidgrt,-10,'T',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,NULL,NULL,NULL,@CCT)  
     
   SET @netvaluegrt =  NULL   
   SET @netpayablegrt = @netvaluegrt       
     
   INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
   VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),2,@netvaluegrt,@netpayablegrt,@previouspaidgrt,-10,'C',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,NULL,NULL,NULL,@CCT)  
  END   
    
 END  
 ELSE IF(@currentticketcount<@previousticketcount)  
 BEGIN  
  --PRINT 'Less Zero'  
    SET @diffctc_ptcless  = (-1*(@currentticketcount-@previousticketcount))  
    SET @diffctc_ptcless_temp = @diffctc_ptcless  
    SET @CashNetValueTicket = (SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    SET @CNV = @CashNetValueTicket  
    SET @LoopCashValueTicket = 1  
      
    IF(@CashNetValueTicket!=0 AND @currentticketcount>0)  
    BEGIN  
      --PRINT '1st'   
      WHILE(@LoopCashValueTicket<=@CNV)  
      BEGIN  
       IF(@diffctc_ptcless>0)  
       BEGIN  
        IF(@CNV>@diffctc_ptcless)  
        BEGIN  
      --PRINT '2nd'  
       SET @CashNetValueTicket = @CashNetValueTicket - 1  
         
       SET @Net_Value_Ticket_C=@CashNetValueTicket  
       SET @Net_Recoverd_Tickets_C=(@LoopCashValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT 
TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
       SET @Net_Payable_Tickes_C=(-1*@LoopCashValueTicket)    
        END   
         
        ELSE IF(@CNV<@diffctc_ptcless)  
        BEGIN  
        --PRINT '3nd'  
       SET @CashNetValueTicket = @CashNetValueTicket - 1  
         
       SET @Net_Value_Ticket_C=@CashNetValueTicket  
       SET @Net_Recoverd_Tickets_C=(@LoopCashValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT 
TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
       SET @Net_Payable_Tickes_C=(-1*@LoopCashValueTicket)  
        END  
          
        ELSE IF(@CNV=@diffctc_ptcless)  
        BEGIN  
        --PRINT '4nd'  
       SET @CashNetValueTicket = @CashNetValueTicket - 1  
         
       SET @Net_Value_Ticket_C=@CashNetValueTicket  
       SET @Net_Recoverd_Tickets_C=(@LoopCashValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT 
TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
       SET @Net_Payable_Tickes_C=(-1*@LoopCashValueTicket)  
        END  
       END  
        SET @diffctc_ptcless = @diffctc_ptcless-1   
     SET @LoopCashValueTicket = @LoopCashValueTicket+1  
      END  
     END  
     ELSE IF(@CashNetValueTicket=0 AND @currentticketcount>0)  
     BEGIN  
     --PRINT '5nd'  
    SET @Net_Value_Ticket_C =(SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransaction
Tickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    SET @Net_Recoverd_Tickets_C =(SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTra
nsactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    SET @Net_Payable_Tickes_C = 0  
     END  
     ELSE IF(@currentticketcount=0)  
     BEGIN  
     --PRINT '6nd'  
      SET @Net_Value_Ticket_C =0  
    SET @Net_Recoverd_Tickets_C =(SELECT NetRecoverdTickets + NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    SET @Net_Payable_Tickes_C = (-1)*(SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
     END  
      
    SET @TicketNetValueTicket =(SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransacti
onTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    SET @TNVT = @TicketNetValueTicket  
    SET @LoopTicketNetValueTicket=1  
      
    IF(@currentticketcount>0)  
    BEGIN  
    --PRINT '7nd'  
     IF(@diffctc_ptcless>0)  
     BEGIN  
      WHILE(@LoopTicketNetValueTicket<=@TNVT)  
      BEGIN  
      --PRINT '8nd'  
       IF(@diffctc_ptcless>0)  
       BEGIN  
      IF(@TicketNetValueTicket>@diffctc_ptcless)  
      BEGIN  
      --PRINT '9nd'  
       SET @TicketNetValueTicket = @TicketNetValueTicket -1  
         
       SET @Net_Value_Ticket_T = @TicketNetValueTicket  
       SET @Net_Recoverd_Tickets_T=(@LoopTicketNetValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
       SET @Net_Payable_Tickes_T = (-1*@LoopTicketNetValueTicket)  
      END  
        
      ELSE IF(@TicketNetValueTicket<@diffctc_ptcless)  
      BEGIN  
      --PRINT '10nd'  
       SET @TicketNetValueTicket = @TicketNetValueTicket -1  
         
       SET @Net_Value_Ticket_T = @TicketNetValueTicket  
       SET @Net_Recoverd_Tickets_T=(@LoopTicketNetValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
       SET @Net_Payable_Tickes_T = (-1*@LoopTicketNetValueTicket)  
      END  
        
      ELSE IF(@TicketNetValueTicket=@diffctc_ptcless)  
      BEGIN  
      --PRINT '11nd'  
       SET @TicketNetValueTicket = @TicketNetValueTicket -1  
         
       SET @Net_Value_Ticket_T = @TicketNetValueTicket  
       SET @Net_Recoverd_Tickets_T=(@LoopTicketNetValueTicket + (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC)))  
       SET @Net_Payable_Tickes_T = (-1*@LoopTicketNetValueTicket)  
      END  
       END  
       SET @diffctc_ptcless = @diffctc_ptcless-1  
       SET @LoopTicketNetValueTicket= @LoopTicketNetValueTicket+1  
      END  
     END  
     ELSE IF(@diffctc_ptcless<=0)  
     BEGIN  
     --PRINT '12nd'  
    SET @Net_Value_Ticket_T=(SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    SET @Net_Recoverd_Tickets_T=(SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    SET @Net_Payable_Tickes_T =0  
     END  
    END  
    ELSE IF(@currentticketcount=0)  
    BEGIN  
    --PRINT '13nd'  
   SET @Net_Value_Ticket_T=0  
   SET @Net_Recoverd_Tickets_T=(SELECT NetRecoverdTickets + NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
   SET @Net_Payable_Tickes_T =(-1)*(SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
    END  
    
  SET @netvalueless = (@Net_Payable_Tickes_T *(SELECT tripAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
  SET @netpayableless =  @netvalueless  
    
  INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
  VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),1,@netvalueless,@netpayableless,@previouspaidless,0,'T',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@Net_Value_Ticket_T,@Net_Recoverd_Tickets_T,@Net_Payable_Tickes_T,@CCT)  
    
  SET @netvalueless = (@Net_Payable_Tickes_C *(SELECT cashAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
  SET @netpayableless =  @netvalueless  
    
  INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
  VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),2,@netvalueless,@netpayableless,@previouspaidless,0,'C',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@Net_Value_Ticket_C,@Net_Recoverd_Tickets_C,@Net_Payable_Tickes_C,@CCT)  
 END  
 ELSE IF(@currentticketcount=@previousticketcount)  
 BEGIN  
  --PRINT 'Equal Zero'  
    
  SET @CashValue_E = (SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTickets 
WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
  SET @CashRecoverd_E = (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionT
ickets WHERE [Option]='C' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
  SET @CashPayable_E =0  
    
  SET @TicketValue_E = (SELECT NetValueTicket FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactionTicket
s WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
  SET @TicketRecoverd_E = (SELECT NetRecoverdTickets FROM tblTransactionTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND DestID=@did2 AND PaymentFlag=2 AND Status>=0 AND ValidFlag=2 AND LoadDate=(SELECT TOP 1 LoadDate FROM tblTransactio
nTickets WHERE [Option]='T' AND ContestID=@cid2 AND AgentNo=@An2 AND PaymentFlag=2 AND DestID=@did2 AND Status>=0 AND ValidFlag=2 ORDER BY LoadDate DESC))  
  SET @TicketPayable_E=0  
    
  SET @netvalueequal = (@TicketPayable_E *(SELECT tripAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
  SET @netpayablerequal =  @netvalueequal  
     
  INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
  VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),1,@netvalueequal,@netpayablerequal,@previouspaidequal,0,'T',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@TicketValue_E,@TicketRecoverd_E,@TicketPayable_E,@CCT)  
    
  SET @netvalueequal = (@CashPayable_E *(SELECT cashAmt FROM tblContestTripMap WHERE ContestID=@cid2 AND DestID=@did2))  
  SET @netpayablerequal =  @netvalueequal  
    
  INSERT INTO tblTransactionTickets(ContestID,ContestName,StartDate,EndDate,AgentNo,LoadDate,Createddate,TicketLists,NetValue,NetPayable,PreviousPaid,[Status],[Option],RuleName,Seq,DestId,ValidFlag,PaymentFlag,EntryFlag,CurrTicketsCount,QualifiedTickets,PriTicketsCount,NetValueTicket,NetRecoverdTickets,NetPayableTickes,CycleCount)  
  VALUES(@cid2,@contname2,@sd2,@ed2,@An2,@ld2,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),2,@netvalueequal,@netpayablerequal,@previouspaidequal,0,'C',@rn2,@s2,CAST(@did2 AS INT),1,1,2,@currentticketcount,(@currentticketcount-@previousticketcount),@previousticketcount,@CashValue_E,@CashRecoverd_E,@CashPayable_E,@CCT)  
    
 END  
 FETCH NEXT FROM AdvanceTicketsLooprun INTO @cid2,@contname2,@sd2,@ed2,@An2,@ld2,@s2,@rn2,@did2,@nt2,@CCT  
END  
CLOSE AdvanceTicketsLooprun  
DEALLOCATE AdvanceTicketsLooprun  
-----------------------------------------------CMCounter 1 AND Advancecounter -1 Run Stop---------------------------------------------  
    
  
----Insert into tblRecoverable Table When present in 0th but not present in 1st run and   
--When NetAmount is Zero in 1st run Start-----------------  
  
IF((SELECT COUNT(ContestID) FROM tblContestMaster WHERE CMCounter=1)>=1)  
BEGIN   
   DECLARE @R_ContestID_T VARCHAR(100),@R_Agentno_T VARCHAR(100),@R_NetAmount_T FLOAT,@R_OpenAmount_T FLOAT  
  DECLARE Recoverable_Data_T CURSOR  
  FOR  
    SELECT TT.ContestID,TT.AgentNo,SUM(TT.NetPaid) AS NP FROM  tblTransactionTickets AS TT  
    WHERE (NOT EXISTS(SELECT * FROM #ResponseTableTempTickets AS RT WHERE TT.ContestID=RT.ContestID AND TT.AgentNo=RT.AgentNo))  
    AND EXISTS(SELECT * FROM #ResponseTableTempTickets AS RT WHERE TT.ContestID=RT.ContestID)  
    AND TT.CycleCount=0 AND TT.PaymentFlag=2 AND  EXISTS (SELECT ContestID FROM tblContestMaster AS TCM WHERE CMCounter=1 AND TT.ContestID=TCM.ContestID)  
    GROUP BY TT.ContestID,TT.AgentNo  
  OPEN Recoverable_Data_T  
  FETCH NEXT FROM Recoverable_Data_T INTO @R_ContestID_T,@R_Agentno_T,@R_NetAmount_T  
  WHILE @@FETCH_STATUS = 0  
  BEGIN  
   IF EXISTS (SELECT DISTINCT AgentNo FROM tblRecoverableCash WHERE AgentNo=@R_Agentno_T AND ValidFlag=1)  
   BEGIN  
    SET @R_OpenAmount_T  = (SELECT OpenRecoverableAmont FROM tblRecoverableCash WHERE AgentNo=@R_Agentno_T AND ValidFlag=1)  
    UPDATE tblRecoverableCash SET PRFNo=@R_ContestID_T, PrsntProcessAmont=(-1*@R_NetAmount_T),RemainAmont=(OpenRecoverableAmont+@R_NetAmount_T),ValidFlag=2  
    WHERE AgentNo=@R_Agentno_T AND ValidFlag=1  
    INSERT INTO tblRecoverableCash(AgentNo,TranDate,OpenRecoverableAmont,PrsntProcessAmont,RemainAmont,ValidFlag,RecoveredFlag)   
    VALUES(@R_Agentno_T,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),(@R_OpenAmount_T+@R_NetAmount_T),0,0,1,1)  
   END  
   ELSE  
   BEGIN  
    INSERT INTO tblRecoverableCash(AgentNo,TranDate,OpenRecoverableAmont,PrsntProcessAmont,RemainAmont,ValidFlag,RecoveredFlag,PRFNo)   
    VALUES(@R_Agentno_T,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),@R_NetAmount_T,0,0,2,1,@R_ContestID_T)  
      
    INSERT INTO tblRecoverableCash(AgentNo,TranDate,OpenRecoverableAmont,PrsntProcessAmont,RemainAmont,ValidFlag,RecoveredFlag)   
    VALUES(@R_Agentno_T,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),@R_NetAmount_T,0,0,1,1)  
   END  
   FETCH NEXT FROM Recoverable_Data_T INTO @R_ContestID_T,@R_Agentno_T,@R_NetAmount_T  
  END  
  CLOSE Recoverable_Data_T  
  DEALLOCATE Recoverable_Data_T  
  
  
  DECLARE Recoverable_Data_Zero_T CURSOR  
  FOR  
   SELECT TT.ContestID,TT.AgentNo,SUM(TT.NetPaid) AS NP FROM  tblTransactionTickets AS TT  
    WHERE  EXISTS (SELECT T.AgentNo FROM #ResponseTableTempTickets AS T WHERE T.NetTickets=0 AND  T.ContestID=TT.ContestID AND T.AgentNo=TT.AgentNo)  
    AND TT.CycleCount=0 AND TT.PaymentFlag=2 AND  EXISTS (SELECT ContestID FROM tblContestMaster AS tcm WHERE CMCounter=1 AND TT.ContestID=tcm.ContestID)   
    GROUP BY TT.ContestID,TT.AgentNo  
  OPEN Recoverable_Data_Zero_T  
  FETCH NEXT FROM Recoverable_Data_Zero_T INTO @R_ContestID_T,@R_Agentno_T,@R_NetAmount_T  
  WHILE @@FETCH_STATUS = 0  
  BEGIN  
   IF EXISTS (SELECT DISTINCT AgentNo FROM tblRecoverableCash WHERE AgentNo=@R_Agentno_T AND ValidFlag=1)  
   BEGIN  
    SET @R_OpenAmount_T  = (SELECT OpenRecoverableAmont FROM tblRecoverableCash WHERE AgentNo=@R_Agentno_T AND ValidFlag=1)  
    UPDATE tblRecoverableCash SET PRFNo=@R_ContestID_T, PrsntProcessAmont=(-1*@R_NetAmount_T),RemainAmont=(OpenRecoverableAmont+@R_NetAmount_T),ValidFlag=2  
    WHERE AgentNo=@R_Agentno_T AND ValidFlag=1  
    INSERT INTO tblRecoverableCash(AgentNo,TranDate,OpenRecoverableAmont,PrsntProcessAmont,RemainAmont,ValidFlag,RecoveredFlag)   
    VALUES(@R_Agentno_T,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),(@R_OpenAmount_T+@R_NetAmount_T),0,0,1,1)  
   END  
   ELSE  
   BEGIN  
    INSERT INTO tblRecoverableCash(AgentNo,TranDate,OpenRecoverableAmont,PrsntProcessAmont,RemainAmont,ValidFlag,RecoveredFlag,PRFNo)   
    VALUES(@R_Agentno_T,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),@R_NetAmount_T,0,0,2,1,@R_ContestID_T)  
      
    INSERT INTO tblRecoverableCash(AgentNo,TranDate,OpenRecoverableAmont,PrsntProcessAmont,RemainAmont,ValidFlag,RecoveredFlag)   
    VALUES(@R_Agentno_T,(CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()),@R_NetAmount_T,0,0,1,1)  
   END  
   FETCH NEXT FROM Recoverable_Data_Zero_T INTO @R_ContestID_T,@R_Agentno_T,@R_NetAmount_T  
  END  
  CLOSE Recoverable_Data_Zero_T  
  DEALLOCATE Recoverable_Data_Zero_T  
END  
----Insert into tblRecoverable Table When present in 0th but not present in 1st run and   
--When NetAmount is Zero in 1st run End-----------------  
    
-----------------------------------------------NetAmount Zero Start------------------------------------------------  
 DECLARE @v_cntid_T DECIMAL(20, 0),@v_agnno_T FLOAT  
 DECLARE tvalidflagtwo CURSOR  
 FOR  
  SELECT RT.ContestID,RT.AgentNo FROM  #ResponseTableTempTickets AS RT  
  WHERE (NOT EXISTS(SELECT * FROM tblTransactionTickets AS TT WHERE TT.ContestID=RT.ContestID AND TT.AgentNo=RT.AgentNo AND TT.CycleCount=1))  
  AND (NOT EXISTS(SELECT * FROM tblTransactionCash AS TC WHERE TC.ContestID=RT.ContestID AND TC.AgentNo=RT.AgentNo AND TC.CycleCount=1))  
  AND  EXISTS (SELECT ContestID FROM tblContestMaster AS tcm WHERE CMCounter>=1 AND Incentive_YorN!='Y' AND RT.ContestID=tcm.ContestID)  
 OPEN tvalidflagtwo  
 FETCH NEXT FROM tvalidflagtwo INTO @v_cntid_T,@v_agnno_T  
 WHILE @@FETCH_STATUS = 0  
 BEGIN  
   --PRINT 'one_1'  
    UPDATE tblTransactionTickets SET ValidFlag=-2 WHERE ValidFlag=1 AND ContestID=@v_cntid_T AND AgentNo=@v_agnno_T  
    
  UPDATE tblTransactionTickets SET NetValueTicket=0,NetRecoverdTickets=0,NetPayableTickes=0 WHERE ValidFlag=-2  
  FETCH NEXT FROM tvalidflagtwo INTO @v_cntid_T,@v_agnno_T  
 END  
 CLOSE tvalidflagtwo  
 DEALLOCATE tvalidflagtwo  
   
   
 DECLARE tvalidflagtwo_Zero CURSOR  
 FOR  
  SELECT RT.ContestID,RT.AgentNo FROM  #ResponseTableTempTickets AS RT  
  WHERE  EXISTS (SELECT AgentNo FROM tblTransactionTickets AS TT WHERE  TT.CycleCount=1 AND TT.CurrTicketsCount=0 AND TT.ContestID=RT.ContestID AND RT.AgentNo=TT.AgentNo)  
  AND  EXISTS (SELECT ContestID FROM tblContestMaster AS tCM WHERE CMCounter=1 AND RT.ContestID=tCM.ContestID)  
 OPEN tvalidflagtwo_Zero  
 FETCH NEXT FROM tvalidflagtwo_Zero INTO @v_cntid_T,@v_agnno_T  
 WHILE @@FETCH_STATUS = 0  
 BEGIN  
 --PRINT 'one_2'  
    UPDATE tblTransactionTickets SET ValidFlag=-2 WHERE ValidFlag=1 AND ContestID=@v_cntid_T AND AgentNo=@v_agnno_T AND CycleCount=1 AND CurrTicketsCount=0  
    
  UPDATE tblTransactionTickets SET NetValueTicket=0,NetRecoverdTickets=0,NetPayableTickes=0 WHERE ValidFlag=-2 AND CycleCount=1 AND CurrTicketsCount=0  
  FETCH NEXT FROM tvalidflagtwo_Zero INTO @v_cntid_T,@v_agnno_T  
 END  
 CLOSE tvalidflagtwo_Zero  
 DEALLOCATE tvalidflagtwo_Zero  
   
 DECLARE tvalidflagtwo_Zero_Y CURSOR  
 FOR  
  SELECT RT.ContestID,RT.AgentNo FROM  #ResponseTableTempTickets AS RT  
  WHERE  EXISTS (SELECT AgentNo FROM tblTransactionTickets AS TT WHERE  TT.CycleCount=1 AND TT.CurrTicketsCount=0 AND TT.ContestID=RT.ContestID AND RT.AgentNo=TT.AgentNo)  
  AND  EXISTS (SELECT ContestID FROM tblContestMaster AS tcm WHERE CMCounter>=2 AND Incentive_YorN!='Y' AND RT.ContestID=tcm.ContestID)  
  OPEN tvalidflagtwo_Zero_Y  
 FETCH NEXT FROM tvalidflagtwo_Zero_Y INTO @v_cntid_T,@v_agnno_T  
 WHILE @@FETCH_STATUS = 0  
 BEGIN  
 --PRINT 'one_3'  
    UPDATE tblTransactionTickets SET ValidFlag=-2 WHERE ValidFlag=1 AND ContestID=@v_cntid_T AND AgentNo=@v_agnno_T AND CycleCount=1 AND CurrTicketsCount=0  
    
  UPDATE tblTransactionTickets SET NetValueTicket=0,NetRecoverdTickets=0,NetPayableTickes=0 WHERE ValidFlag=-2 AND CycleCount=1 AND CurrTicketsCount=0  
  FETCH NEXT FROM tvalidflagtwo_Zero_Y INTO @v_cntid_T,@v_agnno_T  
 END  
 CLOSE tvalidflagtwo_Zero_Y  
 DEALLOCATE tvalidflagtwo_Zero_Y  
     
----------------------------------------------NetAmount Zero End---------------------------------------------------  
DROP TABLE #TempExideContextforTickets  
DROP TABLE #ResponseTableTickets  
DROP TABLE #ResponseTableTempTickets  
DROP TABLE #TempAbsentTickets  
DROP TABLE #TempNetAmountTickets  
DROP TABLE #TempUnionAbsentAmountTickes  
DROP TABLE #TmpUnqCntAgntsTickets  
------------------------------------------Tickets END------------------------------------------------------  
DROP TABLE #TempExideContext  
  
----------------------------------------NetPayableCalc Start---------------------------------------------------------  
  
-----------------------------------NetPayableCalc Cash Start--------------------------------------------------  
SELECT ContestID,AgentNo INTO #TempAbsent FROM tblTransactionCash WHERE CycleCount=0  
EXCEPT  
SELECT ContestID,AgentNo FROM tblTransactionCash WHERE CycleCount=1  
  
SELECT ContestID,AgentNo INTO #TempNetAmount FROM tblTransactionCash WHERE CycleCount=0  
INTERSECT  
SELECT ContestID,AgentNo FROM tblTransactionCash WHERE CycleCount=1 AND NetAmount=0  
  
SELECT ContestID,AgentNo INTO #TempUnionAbsentAmount FROM #TempAbsent  
UNION ALL  
SELECT ContestID,AgentNo FROM #TempNetAmount  
  
SELECT ContestID,AgentNo INTO #TmpUnqCntAgnts FROM #TempUnionAbsentAmount  
WHERE ContestID IN (SELECT ContestID FROM tblContestMaster where Incentive_YorN='Y')  
GROUP BY ContestID,AgentNo  
  
 DECLARE @return_value int  
 UPDATE Cash2  
 SET NetPayable = Cash2.NetAmount-ISNULL(Cash1.SumNetPayble,0),PreviousPaid=ISNULL(Cash1.SumNetPayble,0)  
 FROM tblTransactionCash AS Cash2  
   LEFT JOIN (SELECT SUM(NetPaid) AS SumNetPayble,  
       ContestID,AgentNo  
      FROM tblTransactionCash  
      WHERE  ((tblTransactionCash.paymentflag)=2 AND tblTransactionCash.Status>=0 AND tblTransactionCash.ContestID IN (SELECT ContestID FROM #TmpUnqCntAgnts AS TU WHERE TU.ContestID=tblTransactionCash.ContestID AND TU.AgentNo=tblTransactionCash.AgentNo) AND tblTransactionCash.ContestID IN (SELECT ContestID FROM tblContestMaster WHERE Advancecounter=-1))  
      GROUP BY ContestID,AgentNo) AS Cash1  
  ON Cash2.ContestID = Cash1.ContestID AND Cash2.AgentNo = Cash1.AgentNo  
  WHERE ((Cash2.validflag)=1) AND ((Cash2.paymentflag)=1)  
    
    
 UPDATE Cash2  
 SET NetPayable = Cash2.NetAmount-ISNULL(Cash1.SumNetPayble,0),PreviousPaid=ISNULL(Cash1.SumNetPayble,0)  
 FROM tblTransactionCash AS Cash2  
   LEFT JOIN (SELECT SUM(NetPaid) AS SumNetPayble,  
       ContestID,AgentNo  
      FROM tblTransactionCash  
      WHERE  ((tblTransactionCash.paymentflag)=2 AND tblTransactionCash.Status>=0 AND tblTransactionCash.ContestID NOT IN (SELECT ContestID FROM #TmpUnqCntAgnts AS TU WHERE TU.ContestID=tblTransactionCash.ContestID AND TU.AgentNo=tblTransactionCash.AgentNo))  
      GROUP BY ContestID,AgentNo) AS Cash1  
  ON Cash2.ContestID = Cash1.ContestID AND Cash2.AgentNo = Cash1.AgentNo  
  WHERE ((Cash2.validflag)=1) AND ((Cash2.paymentflag)=1)  
    
    
DROP TABLE #TempAbsent  
DROP TABLE #TempNetAmount  
DROP TABLE #TempUnionAbsentAmount  
DROP TABLE #TmpUnqCntAgnts    
    
-----------------------------------NetPayableCalc Cash End--------------------------------------------------  
    
-----------------------------------NetPayableCalc Points Start--------------------------------------------------      
UPDATE Points2  
SET NetPayable = Points2.NetPoints-ISNULL(Points1.SumNetPayble,0),PreviousPaid=ISNULL(Points1.SumNetPayble,0)  
FROM tblTransactionPoints AS Points2  
  LEFT JOIN (SELECT SUM(NetPaid) AS SumNetPayble,  
                     ContestID,AgentNo  
              FROM tblTransactionPoints  
              WHERE ((tblTransactionPoints.paymentflag)=2 AND tblTransactionPoints.Status>=0)  
              GROUP BY ContestID,AgentNo) AS Points1  
    ON Points2.ContestID = Points1.ContestID AND Points2.AgentNo = Points1.AgentNo  
    WHERE ((Points2.Validflag)=1) AND ((Points2.paymentflag)=1)  
-----------------------------------NetPayableCalc Points End--------------------------------------------------   
  
----------------------------------------NetPayableCalc End-----------------------------------------------------  
  
------------------BalancePayableCalc-------------------------  
    UPDATE Cash SET Cash.BalancePayable=ISNULL(Cash.NetPayable,0)-ISNULL(Cash.NetPaid,0) FROM tblTransactionCash AS Cash  
 WHERE Cash.PaymentFlag=2  
  
 UPDATE Points SET Points.BalancePayable=ISNULL(Points.NetPayable,0)-ISNULL(Points.NetPaid,0) FROM tblTransactionPoints AS Points  
 WHERE  Points.PaymentFlag=2  
----------------------BalancePayableCalc--------------------------  
       
END-- ================================================  
-- Template generated from Template Explorer using:  
-- Create Procedure (New Menu).SQL  
--  
-- Use the Specify Values for Template Parameters   
-- command (Ctrl-Shift-M) to fill in the parameter   
-- values below.  
--  
-- This block of comments will not be included in  
-- the definition of the procedure.  
-- ================================================  
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[NetPayableCalc]    Script Date: 04/20/2018 17:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NetPayableCalc]
	--@Res INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;
	
    -- Insert statements for procedure here
    
    SELECT ContestID,AgentNo INTO #TempAbsent FROM tblTransactionCash WHERE CycleCount=0
	EXCEPT
	SELECT ContestID,AgentNo FROM tblTransactionCash WHERE CycleCount=1

	SELECT ContestID,AgentNo INTO #TempNetAmount FROM tblTransactionCash WHERE CycleCount=0
	INTERSECT
	SELECT ContestID,AgentNo FROM tblTransactionCash WHERE CycleCount=1 AND NetAmount=0

	SELECT ContestID,AgentNo INTO #TempUnionAbsentAmount FROM #TempAbsent
	UNION ALL
	SELECT ContestID,AgentNo FROM #TempNetAmount

	SELECT ContestID,AgentNo INTO #TmpUnqCntAgnts FROM #TempUnionAbsentAmount
	WHERE ContestID IN (SELECT ContestID FROM tblContestMaster where Incentive_YorN='Y')
	GROUP BY ContestID,AgentNo

 DECLARE @return_value int
	UPDATE Cash2
	SET NetPayable = Cash2.NetAmount-ISNULL(Cash1.SumNetPayble,0),PreviousPaid=ISNULL(Cash1.SumNetPayble,0)
	FROM tblTransactionCash AS Cash2
	  LEFT JOIN (SELECT SUM(NetPaid) AS SumNetPayble,
						 ContestID,AgentNo
				  FROM tblTransactionCash
				  WHERE  ((tblTransactionCash.paymentflag)=2 AND tblTransactionCash.Status>=0 AND tblTransactionCash.ContestID IN (SELECT ContestID FROM #TmpUnqCntAgnts AS TU WHERE TU.ContestID=tblTransactionCash.ContestID AND TU.AgentNo=tblTransactionCash.AgentNo) AND tblTransactionCash.ContestID IN (SELECT ContestID FROM tblContestMaster WHERE Advancecounter=-1))
				  GROUP BY ContestID,AgentNo) AS Cash1
		ON Cash2.ContestID = Cash1.ContestID AND Cash2.AgentNo = Cash1.AgentNo
		WHERE ((Cash2.validflag)=1) AND ((Cash2.paymentflag)=1)
		
		
	UPDATE Cash2
	SET NetPayable = Cash2.NetAmount-ISNULL(Cash1.SumNetPayble,0),PreviousPaid=ISNULL(Cash1.SumNetPayble,0)
	FROM tblTransactionCash AS Cash2
	  LEFT JOIN (SELECT SUM(NetPaid) AS SumNetPayble,
						 ContestID,AgentNo
				  FROM tblTransactionCash
				  WHERE  ((tblTransactionCash.paymentflag)=2 AND tblTransactionCash.Status>=0 AND tblTransactionCash.ContestID NOT IN (SELECT ContestID FROM #TmpUnqCntAgnts AS TU WHERE TU.ContestID=tblTransactionCash.ContestID AND TU.AgentNo=tblTransactionCash.AgentNo))
				  GROUP BY ContestID,AgentNo) AS Cash1
		ON Cash2.ContestID = Cash1.ContestID AND Cash2.AgentNo = Cash1.AgentNo
		WHERE ((Cash2.validflag)=1) AND ((Cash2.paymentflag)=1)
		
		
DROP TABLE #TempAbsent
DROP TABLE #TempNetAmount
DROP TABLE #TempUnionAbsentAmount
DROP TABLE #TmpUnqCntAgnts		


UPDATE Points2
SET NetPayable = Points2.NetPoints-ISNULL(Points1.SumNetPayble,0),PreviousPaid=ISNULL(Points1.SumNetPayble,0)
FROM tblTransactionPoints AS Points2
  LEFT JOIN (SELECT SUM(NetPaid) AS SumNetPayble,
                     ContestID,AgentNo
              FROM tblTransactionPoints
              WHERE ((tblTransactionPoints.paymentflag)=2 AND tblTransactionPoints.Status>=0)
              GROUP BY ContestID,AgentNo) AS Points1
    ON Points2.ContestID = Points1.ContestID AND Points2.AgentNo = Points1.AgentNo
    WHERE ((Points2.Validflag)=1) AND ((Points2.paymentflag)=1)
    
END
		
    
   --UPDATE tblTransactionCash SET NetPayable=NetAmount WHERE ValidFlag=1 and PaymentFlag=1
    
	--UPDATE Cash2
	--SET NetPayable = Cash2.NetAmount-ISNULL(Cash1.SumNetPayble,0),PreviousPaid=ISNULL(Cash1.SumNetPayble,0)
	--FROM tblTransactionCash AS Cash2
	--  LEFT JOIN (SELECT SUM(NetPaid) AS SumNetPayble,
	--					 ContestID,AgentNo
	--			  FROM tblTransactionCash
	--			  WHERE  ((tblTransactionCash.paymentflag)=2 AND tblTransactionCash.Status>=0)
	--			  GROUP BY ContestID,AgentNo) AS Cash1
	--	ON Cash2.ContestID = Cash1.ContestID AND Cash2.AgentNo = Cash1.AgentNo
	--	WHERE ((Cash2.validflag)=1) AND ((Cash2.paymentflag)=1)	
  
--UPDATE tblTransactionPoints SET NetPayable=NetPoints WHERE ValidFlag=1 and PaymentFlag=1
    


--UPDATE Tickets2
--	SET NetPayable = Tickets2.NetValue-ISNULL(Tickets1.SumNetPayble,0),PreviousPaid=ISNULL(Tickets1.SumNetPayble,0)
--	FROM tblTransactionTickets AS Tickets2
--	  LEFT JOIN (SELECT SUM(NetPaid) AS SumNetPayble,
--						 ContestID,AgentNo,DestID,TicketLists
--				  FROM tblTransactionTickets
--				  WHERE  ((tblTransactionTickets.paymentflag)=2)
--				  GROUP BY ContestID,AgentNo,DestID,TicketLists) AS Tickets1
--		ON Tickets2.ContestID = Tickets1.ContestID AND Tickets2.AgentNo = Tickets1.AgentNo AND Tickets2.DestID=Tickets1.DestID AND Tickets2.TicketLists=Tickets1.TicketLists
--		WHERE ((Tickets2.validflag)=1) AND ((Tickets2.paymentflag)=1)

--	UPDATE Tickets2
--SET NetPayable = Tickets2.NetValue-ISNULL(Tickets1.SumNetPayble,0),PreviousPaid=ISNULL(Tickets1.SumNetPayble,0)
--FROM tblTransactionTickets AS Tickets2
--  LEFT JOIN (SELECT SUM(NetPaid) AS SumNetPayble,
--                     ContestID,AgentNo
--              FROM tblTransactionTickets
--              WHERE ((tblTransactionTickets.paymentflag)=2)
--              GROUP BY ContestID,AgentNo) AS Tickets1
--    ON Tickets2.ContestID = Tickets1.ContestID AND Tickets2.AgentNo = Tickets1.AgentNo
--    WHERE ((Tickets2.validflag)=1) AND ((Tickets2.paymentflag)=1)

--UPDATE Tickets2
--	SET NetPayable = Tickets2.NetValue-ISNULL(Tickets1.SumNetPayble,0),PreviousPaid=ISNULL(Tickets1.SumNetPayble,0)
--	FROM tblTransactionTickets AS Tickets2
--	  LEFT JOIN (SELECT SUM(NetPaid) AS SumNetPayble,
--						 ContestID,AgentNo,DestID
--				  FROM tblTransactionTickets
--				  WHERE  ((tblTransactionTickets.paymentflag)=2)
--				  GROUP BY ContestID,AgentNo,DestID) AS Tickets1
--		ON Tickets2.ContestID = Tickets1.ContestID AND Tickets2.AgentNo = Tickets1.AgentNo AND Tickets2.DestID=Tickets1.DestID
--		WHERE ((Tickets2.validflag)=1) AND ((Tickets2.paymentflag)=1)
GO
/****** Object:  View [dbo].[ExideRuleEngineCallidus]    Script Date: 04/20/2018 17:36:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ExideRuleEngineCallidus] as 
Select [Criteria],[Period],[Type],[Seq],[Rule Name],[1],[2],[3],[4],[5],Payable  From [Callidus].[dbo].[ExideRuleEngine]
GO
/****** Object:  View [dbo].[ExideReportDataUpdateCallidus]    Script Date: 04/20/2018 17:36:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ExideReportDataUpdateCallidus] as 
Select [Agent No],[ContestName],[DOJ],[DOT],[Period],[Start_Date],[End_Date],[AgType],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31],[32],[33],[34],[35],[ContestId],[LoadDate]  From [Callidus].[dbo].[ExideReportDataUpdate]
GO
/****** Object:  View [dbo].[ExideContestCallidus]    Script Date: 04/20/2018 17:36:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ExideContestCallidus] as 
Select [Contest Name],[Period],Start_Date,End_Date,Type,[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[Valid Flag],Report_Show,[ContestId]  From [Callidus].[dbo].[ExideContest]
GO
/****** Object:  View [dbo].[ExideAdvisorDetailsCallidus]    Script Date: 04/20/2018 17:36:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ExideAdvisorDetailsCallidus] as 
Select AgentNo,AgentName,AGTYPE,IRDNO,DtApp,DtTerm,BranchCode,BankACNumber,IFSCCode,Load_Date From [Callidus].[dbo].[ExideAdvisorDetails]
GO
/****** Object:  StoredProcedure [dbo].[CreateContestid]    Script Date: 04/20/2018 17:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateContestid] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		
    -- Insert statements for procedure here
		SELECT  0 AS ContestID,DATEPART(DAY,GETDATE()) as CrtDay,DATEPART(MONTH,GETDATE()) as CrtMnt,DATEPART(YEAR,GETDATE()) as CrtYr,1 AS 'ActiveRecord',[Contest Name],
	(CAST(YEAR([Start_Date]) AS BIGINT)*100+MONTH([Start_Date]))*100+DAY([Start_Date]) AS StartDate,
	(CAST(YEAR([End_Date]) AS BIGINT)*100+MONTH([End_Date]))*100+DAY([End_Date]) AS EndDate INTO #TempContestMaster
	 FROM ExideContest EC WHERE NOT EXISTS
	 (SELECT * FROM tblContestMaster CM WHERE EC.[Contest Name]=CM.ContestName AND (CAST(YEAR(EC.[Start_Date]) AS BIGINT)*100+MONTH(EC.[Start_Date]))*100+DAY(EC.[Start_Date])=CM.StartDate 
	 AND (CAST(YEAR(EC.[End_Date]) AS BIGINT)*100+MONTH(EC.[End_Date]))*100+DAY(EC.[End_Date])=CM.EndDate)
	GROUP BY [Contest Name],[Start_Date],[End_Date]
	
	
	DECLARE @ContestID INT,@CrtDay INT,@CrtMnt INT,@CrtYr INT,@ActiveRecord BIT,@ContestName NVARCHAR(255),@StartDate INT,@EndDate INT
	DECLARE @cid DECIMAL(20,0)
	
	DECLARE Schedule CURSOR
	FOR
		SELECT ContestID,CrtDay,CrtMnt,CrtYr,ActiveRecord,[Contest Name],StartDate,EndDate FROM #TempContestMaster
	OPEN Schedule
	FETCH NEXT FROM Schedule INTO @ContestID,@CrtDay,@CrtMnt,@CrtYr,@ActiveRecord,@ContestName,@StartDate,@EndDate
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @cid = (SELECT MAX(ContestID) FROM #TempContestMaster WHERE StartDate=@StartDate)
		IF(@cid=0)
		BEGIN
			UPDATE #TempContestMaster SET ContestID=SUBSTRING(CONVERT(VARCHAR(255),StartDate),1,6)+'001' WHERE [Contest Name]=@ContestName AND StartDate=@StartDate AND EndDate=@EndDate
		END
		ELSE
		BEGIN
			UPDATE #TempContestMaster SET ContestID=SUBSTRING(CONVERT(VARCHAR(255),StartDate),1,6)+SUBSTRING(CONVERT(VARCHAR(255),@cid),7,3)+1 WHERE [Contest Name]=@ContestName AND StartDate=@StartDate AND EndDate=@EndDate
		END
		
		FETCH NEXT FROM Schedule INTO @ContestID,@CrtDay,@CrtMnt,@CrtYr,@ActiveRecord,@ContestName,@StartDate,@EndDate
	END
	CLOSE Schedule
	DEALLOCATE Schedule
	
	INSERT INTO tblContestMaster (ContestID,CrtDay,CrtMnt,CrtYr,ActiveRecrd,ContestName,StartDate,EndDate)
	SELECT ContestID,CrtDay,CrtMnt,CrtYr,ActiveRecord,[Contest Name],StartDate,EndDate FROM #TempContestMaster
	
	 UPDATE exidecontest1 SET exidecontest1.ContestID=exidecontest2.ContestID FROM ExideContest AS exidecontest1
	 INNER JOIN (SELECT ContestID,ContestName,StartDate,EndDate FROM tblContestMaster) AS exidecontest2
	 ON exidecontest2.ContestName=exidecontest1.[Contest Name] AND
	exidecontest2.StartDate=(CAST(YEAR(exidecontest1.[Start_Date]) AS BIGINT)*100+MONTH(exidecontest1.[Start_Date]))*100+DAY(exidecontest1.[Start_Date])
	 AND exidecontest2.EndDate=(CAST(YEAR(exidecontest1.[End_Date]) AS BIGINT)*100+MONTH(exidecontest1.[End_Date]))*100+DAY(exidecontest1.[End_Date])

	UPDATE exidecontest3 SET exidecontest3.ContestID=exidecontest4.ContestID FROM ExideReportDataUpdate AS exidecontest3
	 INNER JOIN (SELECT ContestID,ContestName,StartDate,EndDate FROM tblContestMaster) AS exidecontest4
	 ON exidecontest4.ContestName=exidecontest3.ContestName AND
	exidecontest4.StartDate=(CAST(YEAR(exidecontest3.[Start_Date]) AS BIGINT)*100+MONTH(exidecontest3.[Start_Date]))*100+DAY(exidecontest3.[Start_Date])
	 AND exidecontest4.EndDate=(CAST(YEAR(exidecontest3.[End_Date]) AS BIGINT)*100+MONTH(exidecontest3.[End_Date]))*100+DAY(exidecontest3.[End_Date])
	
END
GO
/****** Object:  UserDefinedFunction [dbo].[TVFContestWiseTdyDeviationListsTicketsDApprover]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TVFContestWiseTdyDeviationListsTicketsDApprover]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(200)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	
	SELECT  tTT.ContestID, tCM.ContestName, tTT.AgentNo,tTT.LoadDate,tTT.TicketLists,tTT.[Option],tTT.DestID,tTT.PreviousNetPayable, tTT.NetPayable, tTT.Remarks,tTT.[Status],tTT.EntryFlag,tTT.Approver1Remarks,tTT.DeviationApprRemarks
	FROM tblTransactionTickets AS tTT LEFT JOIN tblContestMaster AS tCM ON  tTT.ContestID = tCM.ContestID
	WHERE ((( tTT.NetPayable)<>0) AND (( tTT.ValidFlag)=1) AND (( tTT.PaymentFlag)=1) AND (( tTT.Status)=2) AND ((tTT.EntryFlag)=1) )
	AND 
	EXISTS(SELECT tCUm.[CUid] FROM [tblCUmap] AS tCUm WHERE tCUm.Cid=tCM.Cid AND tCUm.UId=@UId)


)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFContestWiseTdyDeviationListsCashDApprover]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TVFContestWiseTdyDeviationListsCashDApprover]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(200)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	
	SELECT  tTC.ContestID, tCM.ContestName, tTC.AgentNo,tTC.LoadDate,tTC.PreviousNetPayable, tTC.NetPayable, tTC.Remarks,tTC.[Status],tTC.EntryFlag,tTC.Approver1Remarks,tTC.DeviationApprRemarks
	FROM tblTransactionCash AS tTC LEFT JOIN tblContestMaster AS tCM ON  tTC.ContestID = tCM.ContestID
	WHERE ((( tTC.NetPayable)<>0) AND (( tTC.ValidFlag)=1) AND (( tTC.PaymentFlag)=1) AND (( tTC.Status)=2) AND ((tTC.EntryFlag)=1) )
	AND 
	EXISTS(SELECT tCUm.[CUid] FROM [tblCUmap] AS tCUm WHERE tCUm.Cid=tCM.Cid AND tCUm.UId=@UId)


)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFPRFCashComplete]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TVFPRFCashComplete]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(200) ,
	@AgTypeId BIGINT
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	     SELECT ContestID,AgentNo FROM
       (   
        SELECT 
        TC.ContestID,
		TC.AgentNo
		FROM tblTransactionCash AS TC
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TC.ContestID
		LEFT JOIN tblAgType AS AT
		ON AT.Agtypes=CM.AGTYPES
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId AND AT.AgID=@AgTypeId
		AND TC.ValidFlag=1 AND TC.PaymentFlag=1 AND TC.EntryFlag=2 AND TC.[Status]=2

		UNION ALL

		SELECT 
		TC.ContestID,
		TC.AgentNo
		FROM tblTransactionCash AS TC
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TC.ContestID
		LEFT JOIN tblAgType AS AT
		ON AT.Agtypes=CM.AGTYPES
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId AND AT.AgID=@AgTypeId
		AND TC.ValidFlag=1 AND TC.PaymentFlag=1 AND TC.EntryFlag=1 AND TC.[Status]=4
		
		
		
		) AS CONAG
		GROUP BY ContestID,AgentNo

)
GO
/****** Object:  StoredProcedure [dbo].[BalancePayableCalc]    Script Date: 04/20/2018 17:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BalancePayableCalc] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
		UPDATE Cash SET Cash.BalancePayable=ISNULL(Cash.NetPayable,0)-ISNULL(Cash.NetPaid,0) FROM tblTransactionCash AS Cash
		WHERE Cash.PaymentFlag=2

		UPDATE Points SET Points.BalancePayable=ISNULL(Points.NetPayable,0)-ISNULL(Points.NetPaid,0) FROM tblTransactionPoints AS Points
		WHERE Points.PaymentFlag=2
END
GO
/****** Object:  UserDefinedFunction [dbo].[TVFPRFTicketsList]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TVFPRFTicketsList]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(200) ,
	@AgTypeId BIGINT
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
		SELECT 
		TT.AgentNo,
		CONVERT(DATE,GETDATE())  AS TranDate,
		TT.TicketLists ,
		ISNULL(TT.NetPayable,0) AS NetAmount,
		(0) AS DeviationAmt,
		(ISNULL(TT.NetPayable,0)) AS NetPayout,
		(AT.AgID) AS AgClass

		FROM tblTransactionTickets AS TT
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TT.ContestID
		LEFT JOIN tblAgType AS AT
		ON AT.Agtypes=CM.AGTYPES
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId AND AT.AgID=@AgTypeId
		AND TT.ValidFlag=1 AND TT.PaymentFlag=1 AND TT.EntryFlag=2 AND TT.[Status]=2 AND UPPER(TT.[Option])='T' AND ((ISNULL(TT.NetPayable,0))>0)

		UNION ALL

		SELECT 
		TT.AgentNo,
		CONVERT(DATE,GETDATE())  AS TranDate,
		TT.TicketLists ,
		ISNULL(TT.NetPayable,0) AS NetAmount,
		(0) AS DeviationAmt,
		(ISNULL(TT.NetPayable,0)) AS NetPayout,
		(AT.AgID) AS AgClass

		FROM tblTransactionTickets AS TT
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TT.ContestID
		LEFT JOIN tblAgType AS AT
		ON AT.Agtypes=CM.AGTYPES
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId AND AT.AgID=@AgTypeId
		AND TT.ValidFlag=1 AND TT.PaymentFlag=1 AND TT.EntryFlag=1 AND TT.[Status]=4 AND UPPER(TT.[Option])='T' AND ((ISNULL(TT.NetPayable,0))>0)
)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFPRFTicketsComplete]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TVFPRFTicketsComplete]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(200) ,
	@AgTypeId BIGINT
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	     
 SELECT ContestID,AgentNo FROM
        (SELECT 
		TT.ContestID,
		TT.AgentNo

		FROM tblTransactionTickets AS TT
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TT.ContestID
		LEFT JOIN tblAgType AS AT
		ON AT.Agtypes=CM.AGTYPES
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId AND AT.AgID=@AgTypeId
		AND TT.ValidFlag=1 AND TT.PaymentFlag=1 AND TT.EntryFlag=2 AND TT.[Status]=2 AND UPPER(TT.[Option])='C'

		UNION ALL

		SELECT 
		TT.ContestID,
		TT.AgentNo
	

		FROM tblTransactionTickets AS TT
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TT.ContestID
		LEFT JOIN tblAgType AS AT
		ON AT.Agtypes=CM.AGTYPES
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId AND AT.AgID=@AgTypeId
		AND TT.ValidFlag=1 AND TT.PaymentFlag=1 AND TT.EntryFlag=1 AND TT.[Status]=4 AND UPPER(TT.[Option])='C'

		---------------

		UNION ALL

		SELECT 
		TT.ContestID,
		TT.AgentNo

		FROM tblTransactionTickets AS TT
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TT.ContestID
		LEFT JOIN tblAgType AS AT
		ON AT.Agtypes=CM.AGTYPES
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId AND AT.AgID=@AgTypeId
		AND TT.ValidFlag=1 AND TT.PaymentFlag=1 AND TT.EntryFlag=2 AND TT.[Status]=2 AND UPPER(TT.[Option])='T' AND ((ISNULL(TT.NetPayable,0))<0)

		UNION ALL

		SELECT 
		TT.ContestID,
		TT.AgentNo

		FROM tblTransactionTickets AS TT
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TT.ContestID
		LEFT JOIN tblAgType AS AT
		ON AT.Agtypes=CM.AGTYPES
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId AND AT.AgID=@AgTypeId
		AND TT.ValidFlag=1 AND TT.PaymentFlag=1 AND TT.EntryFlag=1 AND TT.[Status]=4 AND UPPER(TT.[Option])='T' AND ((ISNULL(TT.NetPayable,0))<0)
	) AS CONAG
		GROUP BY ContestID,AgentNo
)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFTicketsApprove2List]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TVFTicketsApprove2List]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(200) 
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
		
		
		SELECT TT.PRFNoGenREF, TT.PRFNo, TT.PRFGENDate, TT.PRFAmount, TT.[Status]
		FROM tblTransactionTickets AS TT
		
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TT.ContestID
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId 
		AND TT.ValidFlag>=1 AND TT.PaymentFlag=2 AND (TT.EntryFlag) in (1,2) AND TT.[Status]=6
		AND UPPER(TT.[Option])='T' AND TT.NetPayable>0
		


)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFTicketsApprove1List]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TVFTicketsApprove1List]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(200) 
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
		
		
		SELECT TT.PRFNoGenREF, TT.PRFNo, TT.PRFGENDate, TT.PRFAmount, TT.Status
		FROM tblTransactionTickets AS TT
		
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TT.ContestID
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId 
		AND TT.ValidFlag>=1 AND TT.PaymentFlag=2 AND (TT.EntryFlag) in (1,2) AND TT.[Status]=5
		AND UPPER(TT.[Option])='T' AND TT.NetPayable>0
		


)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFUserWiseTdyContestListsTicketsMaker]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TVFUserWiseTdyContestListsTicketsMaker]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(255)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	
	SELECT  tTC.ContestID, tCM.ContestName, tCM.AGTYPES, COUNT(tTC.AgentNo) AS CountOfAgentNo, SUM(tTC.NetPayable) AS SumOfNetPayable, SUM(tTC.PreviousPaid) AS SumOfPreviousPaid
	FROM tblTransactionTickets AS tTC LEFT JOIN tblContestMaster AS tCM ON  tTC.ContestID = tCM.ContestID
	WHERE ((( tTC.NetPayable)<>0) AND (( tTC.ValidFlag)=1) AND (( tTC.PaymentFlag)=1) AND (( tTC.Status)=0))
	AND 
	EXISTS(SELECT tCUm.[CUid] FROM [tblCUmap] AS tCUm WHERE tCUm.Cid=tCM.Cid AND tCUm.UId=@UId)
	GROUP BY tTC.ContestID, tCM.ContestName, tCM.AGTYPES

)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFUserWiseTdyContestListsTicketsCheker]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TVFUserWiseTdyContestListsTicketsCheker]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(200)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	
	SELECT  tTC.ContestID, tCM.ContestName, tCM.AGTYPES, COUNT(tTC.AgentNo) AS CountOfAgentNo, SUM(tTC.NetPayable) AS SumOfNetPayable, SUM(tTC.PreviousPaid) AS SumOfPreviousPaid
	FROM tblTransactionTickets AS tTC LEFT JOIN tblContestMaster AS tCM ON  tTC.ContestID = tCM.ContestID
	WHERE ((( tTC.NetPayable)<>0) AND (( tTC.ValidFlag)=1) AND (( tTC.PaymentFlag)=1) AND (( tTC.Status)=1))
	AND 
	EXISTS(SELECT tCUm.[CUid] FROM [tblCUmap] AS tCUm WHERE tCUm.Cid=tCM.Cid AND tCUm.UId=@UId)
	GROUP BY tTC.ContestID, tCM.ContestName, tCM.AGTYPES

)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFUserWiseTdyContestListsCashMaker]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TVFUserWiseTdyContestListsCashMaker]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(255)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	
	SELECT  tTC.ContestID, tCM.ContestName, tCM.AGTYPES, COUNT(tTC.AgentNo) AS CountOfAgentNo, SUM(tTC.NetPayable) AS SumOfNetPayable, SUM(tTC.PreviousPaid) AS SumOfPreviousPaid
	FROM tblTransactionCash AS tTC LEFT JOIN tblContestMaster AS tCM ON  tTC.ContestID = tCM.ContestID
	WHERE ((( tTC.NetPayable)<>0) AND (( tTC.ValidFlag)=1) AND (( tTC.PaymentFlag)=1) AND (( tTC.Status)=0))
	AND 
	EXISTS(SELECT tCUm.[CUid] FROM [tblCUmap] AS tCUm WHERE tCUm.Cid=tCM.Cid AND tCUm.UId=@UId)
	GROUP BY tTC.ContestID, tCM.ContestName, tCM.AGTYPES

)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFUserWiseTdyContestListsCashCheker]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TVFUserWiseTdyContestListsCashCheker]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(200)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	
	SELECT  tTC.ContestID, tCM.ContestName, tCM.AGTYPES, COUNT(tTC.AgentNo) AS CountOfAgentNo, SUM(tTC.NetPayable) AS SumOfNetPayable, SUM(tTC.PreviousPaid) AS SumOfPreviousPaid
	FROM tblTransactionCash AS tTC LEFT JOIN tblContestMaster AS tCM ON  tTC.ContestID = tCM.ContestID
	WHERE ((( tTC.NetPayable)<>0) AND (( tTC.ValidFlag)=1) AND (( tTC.PaymentFlag)=1) AND (( tTC.Status)=1))
	AND 
	EXISTS(SELECT tCUm.[CUid] FROM [tblCUmap] AS tCUm WHERE tCUm.Cid=tCM.Cid AND tCUm.UId=@UId)
	GROUP BY tTC.ContestID, tCM.ContestName, tCM.AGTYPES

)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFUserWiseChannels]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TVFUserWiseChannels]
(	
	-- Add the parameters for the function here
	@Status INT, 
	@UId VARCHAR(200)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT CM.Cid,CM.ChanelName,CM.[Description] FROM tblChannelMaster AS CM
	WHERE CM.Cid in (SELECT CUMap.Cid FROM tblCUmap AS CUMap WHERE CUMap.Cid=CM.Cid AND CUMap.UId=@UId AND CUMap.[status]=COALESCE(@Status,CM.[status]))
	AND CM.[status]=COALESCE(@Status,CM.[status]) 
)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFUserWiseAgentsLists]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TVFUserWiseAgentsLists]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(200)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	
		SELECT AM.AgentNo,AM.AgentName,AM.AGTYPE,AM.DtApp,AM.DtTerm,AM.BankACNumber,AM.BranchCode,AM.IFSCCode,AM.IRDNO,AM.Load_Date FROM tblAgentMaster AS AM
		LEFT JOIN [tblAgentTypeMaster] AS ATM
		ON ATM.AgentTypeName=AM.AGTYPE
		LEFT JOIN tblCAmap AS CAmap
		ON CAmap.AgntTypeId=ATM.AgntTypeId
		LEFT JOIN tblCUmap AS tCUm
		ON CAmap.Cid=tCUm.Cid
		WHERE tCUm.UId=@UId

)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFTdyContestWiseagentsListsTicketsMaker]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TVFTdyContestWiseagentsListsTicketsMaker]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(255),
	@ContestID BIGINT
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT 
			ContestID,
			ContestName,
			AgentNo,
			SUM(NetValue) AS NetValue,
			SUM(PreviousNetPayable) AS PreviousNetPayable,
			SUM(NetPayable) AS NetPayable,
			TicketLists,
			[Option],
			DestID,
			EntryFlag,
			[Status],
			AgentName,
			AGTYPE,
			IRDNO,
			DtApp,
			DtTerm,
			BranchCode,
			BankACNumber,
			IFSCCode,
			[Validation]
	
		
	
	 FROM
	(

		SELECT TT.ContestID, TT.ContestName, TT.AgentNo, TT.NetValue, TT.PreviousNetPayable, TT.NetPayable, TT.TicketLists, TT.[Option],TT.DestID, TT.EntryFlag, TT.[Status], AM.AgentName, AM.AGTYPE, AM.IRDNO, AM.DtApp, AM.DtTerm, AM.BranchCode, AM.BankACNumber, AM.IFSCCode


,   ( CASE
			  WHEN NOT AM.DtTerm IS NULL  
        	  OR LEN(AM.AgentName)<2
        	  OR AM.BankACNumber IS NULL  
        	  OR AM.IFSCCode IS NULL
			  OR AM.IRDNO IS NULL  
			  OR AM.IRDNO IS NULL 
			  OR AM.IRDNO IS NULL  
			  OR AM.IRDNO IS NULL 
			  OR TT.AgentNo=GLA.AgentNo THEN 'FAIL'
			  ELSE
			  CASE
			  WHEN NOT AM.DtTerm IS NULL  
        	  OR LEN(AM.AgentName)<2
        	  OR AM.BankACNumber IS NULL  
        	  OR (NOT (LEN(AM.IFSCCode)=11) AND (NOT UPPER(AM.IFSCCode)='NA'))
			  OR AM.IRDNO IS NULL  
			  OR AM.IRDNO IS NULL 
			  OR AM.IRDNO IS NULL  
			  OR AM.IRDNO IS NULL 
			  OR TT.AgentNo=GLA.AgentNo THEN 'FAIL'
			  ELSE 'PASS'
			  END
			  END
		    ) AS [Validation]


		FROM tblTransactionTickets AS TT
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TT.ContestID
		LEFT JOIN tblAgentMaster AS AM
		ON AM.AgentNo=TT.AgentNo
		LEFT JOIN tblGregListAgentNo AS GLA
		ON GLA.AgentNo=TT.AgentNo
		WHERE EXISTS(SELECT AgentTypeName FROM tblCAmap AS CAM
		LEFT JOIN tblAgentTypeMaster AS ATM
		ON CAM.AgntTypeId=ATM.AgntTypeId
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CAM.Cid
		WHERE CUmap.[UId]=COALESCE(@UId,CUmap.[UId]) AND CAM.Cid=CM.Cid)
		AND
		TT.ContestID=@ContestID
		AND
		TT.ValidFlag=1
		AND
		TT.[Status]=0
		AND
		TT.PaymentFlag=1
		AND
		NOT TT.NetPayable=0) AS CWALT
        GROUP BY
        
            ContestID,
			ContestName,
			AgentNo,
			TicketLists,
			[Option],
			DestID,
			EntryFlag,
			[Status],
			AgentName,
			AGTYPE,
			IRDNO,
			DtApp,
			DtTerm,
			BranchCode,
			BankACNumber,
			IFSCCode,
			[Validation]
		
)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFTdyContestWiseagentsListsTicketsCheker]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TVFTdyContestWiseagentsListsTicketsCheker]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(255),
	@ContestID BIGINT
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT 
			ContestID,
			ContestName,
			AgentNo,
			SUM(NetValue) AS NetValue,
			SUM(PreviousNetPayable) AS PreviousNetPayable,
			SUM(NetPayable) AS NetPayable,
			TicketLists,
			[Option],
			DestID,
			EntryFlag,
			[Status],
			AgentName,
			AGTYPE,
			IRDNO,
			DtApp,
			DtTerm,
			BranchCode,
			BankACNumber,
			IFSCCode,
			[Validation]
	
		
	
	 FROM
	(

		SELECT TT.ContestID, TT.ContestName, TT.AgentNo, TT.NetValue, TT.PreviousNetPayable, TT.NetPayable, TT.TicketLists, TT.[Option],TT.DestID, TT.EntryFlag, TT.[Status], AM.AgentName, AM.AGTYPE, AM.IRDNO, AM.DtApp, AM.DtTerm, AM.BranchCode, AM.BankACNumber, AM.IFSCCode


,   ( CASE
			  WHEN NOT AM.DtTerm IS NULL  
        	  OR LEN(AM.AgentName)<2
        	  OR AM.BankACNumber IS NULL  
        	  OR AM.IFSCCode IS NULL
			  OR AM.IRDNO IS NULL  
			  OR AM.IRDNO IS NULL 
			  OR AM.IRDNO IS NULL  
			  OR AM.IRDNO IS NULL 
			  OR TT.AgentNo=GLA.AgentNo THEN 'FAIL'
			  ELSE
			  CASE
			  WHEN NOT AM.DtTerm IS NULL  
        	  OR LEN(AM.AgentName)<2
        	  OR AM.BankACNumber IS NULL  
        	  OR (NOT (LEN(AM.IFSCCode)=11) AND (NOT UPPER(AM.IFSCCode)='NA'))
			  OR AM.IRDNO IS NULL  
			  OR AM.IRDNO IS NULL 
			  OR AM.IRDNO IS NULL  
			  OR AM.IRDNO IS NULL 
			  OR TT.AgentNo=GLA.AgentNo THEN 'FAIL'
			  ELSE 'PASS'
			  END
			  END
		    ) AS [Validation]


		FROM tblTransactionTickets AS TT
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TT.ContestID
		LEFT JOIN tblAgentMaster AS AM
		ON AM.AgentNo=TT.AgentNo
		LEFT JOIN tblGregListAgentNo AS GLA
		ON GLA.AgentNo=TT.AgentNo
		WHERE EXISTS(SELECT AgentTypeName FROM tblCAmap AS CAM
		LEFT JOIN tblAgentTypeMaster AS ATM
		ON CAM.AgntTypeId=ATM.AgntTypeId
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CAM.Cid
		WHERE CUmap.[UId]=COALESCE(@UId,CUmap.[UId]) AND CAM.Cid=CM.Cid)
		AND
		TT.ContestID=@ContestID
		AND
		TT.ValidFlag=1
		AND
		TT.[Status]=1
		AND
		TT.PaymentFlag=1
		AND
		NOT TT.NetPayable=0) AS CWALT
        GROUP BY
        
            ContestID,
			ContestName,
			AgentNo,
			TicketLists,
			[Option],
			DestID,
			EntryFlag,
			[Status],
			AgentName,
			AGTYPE,
			IRDNO,
			DtApp,
			DtTerm,
			BranchCode,
			BankACNumber,
			IFSCCode,
			[Validation]
		
)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFTdyContestWiseagentsListsCashMaker]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TVFTdyContestWiseagentsListsCashMaker]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(255),
	@ContestID BIGINT
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	 SELECT 
	            ContestID,
		        ContestName,
		        AgentNo,
		        SUM(NetAmount) AS NetAmount,
		        SUM(PreviousNetPayable) AS PreviousNetPayable,
		        SUM(NetPayable) AS NetPayable,
		        EntryFlag,
		        [Status],
		        AgentName,
		        AGTYPE,
		        IRDNO,
		        DtApp,
		        DtTerm,
		        BranchCode,
		        BankACNumber,
		        IFSCCode,
		        [Validation]
	
	
	 FROM 
	(SELECT  TC.ContestID,CM.ContestName,TC.AgentNo,TC.NetAmount,TC.PreviousNetPayable,TC.NetPayable,TC.EntryFlag,TC.[Status],AM.AgentName,AM.AGTYPE,AM.IRDNO,AM.DtApp,AM.DtTerm,AM.BranchCode,AM.BankACNumber,AM.IFSCCode
		,   ( CASE
			  WHEN NOT AM.DtTerm IS NULL  
        	  OR LEN(AM.AgentName)<2
        	  OR AM.BankACNumber IS NULL  
        	  OR AM.IFSCCode IS NULL
			  OR AM.IRDNO IS NULL  
			  OR AM.IRDNO IS NULL 
			  OR AM.IRDNO IS NULL  
			  OR AM.IRDNO IS NULL 
			  OR TC.AgentNo=GLA.AgentNo THEN 'FAIL'
			  ELSE
			  CASE
			  WHEN NOT AM.DtTerm IS NULL  
        	  OR LEN(AM.AgentName)<2
        	  OR AM.BankACNumber IS NULL  
        	  OR (NOT (LEN(AM.IFSCCode)=11) AND (NOT UPPER(AM.IFSCCode)='NA'))
			  OR AM.IRDNO IS NULL  
			  OR AM.IRDNO IS NULL 
			  OR AM.IRDNO IS NULL  
			  OR AM.IRDNO IS NULL 
			  OR TC.AgentNo=GLA.AgentNo THEN 'FAIL'
			  ELSE 'PASS'
			  END
			  END
		    ) AS [Validation]
		FROM tblTransactionCash AS TC
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TC.ContestID
		LEFT JOIN tblAgentMaster AS AM
		ON AM.AgentNo=TC.AgentNo
		LEFT JOIN tblGregListAgentNo AS GLA
		ON GLA.AgentNo=TC.AgentNo
		WHERE EXISTS(SELECT AgentTypeName FROM tblCAmap AS CAM
		LEFT JOIN tblAgentTypeMaster AS ATM
		ON CAM.AgntTypeId=ATM.AgntTypeId
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CAM.Cid
		WHERE CUmap.[UId]=COALESCE(@UId,CUmap.[UId]) AND CAM.Cid=CM.Cid)
		AND
		TC.ContestID=@ContestID
		AND
		TC.ValidFlag=1
		AND
		TC.[Status]=0
		AND
		TC.PaymentFlag=1
		AND
		NOT TC.NetPayable=0) AS CWALC
        GROUP BY 
		        ContestID,
				ContestName,
				AgentNo,
				EntryFlag,
		        [Status],
		        AgentName,
		        AGTYPE,
		        IRDNO,
		        DtApp,
		        DtTerm,
		        BranchCode,
		        BankACNumber,
		        IFSCCode,
		        [Validation]
)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFTdyContestWiseagentsListsCashCheker]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TVFTdyContestWiseagentsListsCashCheker]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(200),
	@ContestID BIGINT
)
RETURNS TABLE 
AS
RETURN 
(
	
	-- Add the SELECT statement with parameter references here
	 SELECT 
	            ContestID,
		        ContestName,
		        AgentNo,
		        SUM(NetAmount) AS NetAmount,
		        SUM(PreviousNetPayable) AS PreviousNetPayable,
		        SUM(NetPayable) AS NetPayable,
		        EntryFlag,
		        [Status],
		        AgentName,
		        AGTYPE,
		        IRDNO,
		        DtApp,
		        DtTerm,
		        BranchCode,
		        BankACNumber,
		        IFSCCode,
		        [Validation]
	
	
	 FROM 
	(SELECT  TC.ContestID,CM.ContestName,TC.AgentNo,TC.NetAmount,TC.PreviousNetPayable,TC.NetPayable,TC.EntryFlag,TC.[Status],AM.AgentName,AM.AGTYPE,AM.IRDNO,AM.DtApp,AM.DtTerm,AM.BranchCode,AM.BankACNumber,AM.IFSCCode
		,   ( CASE
			  WHEN NOT AM.DtTerm IS NULL  
        	  OR LEN(AM.AgentName)<2
        	  OR AM.BankACNumber IS NULL  
        	  OR AM.IFSCCode IS NULL
			  OR AM.IRDNO IS NULL  
			  OR AM.IRDNO IS NULL 
			  OR AM.IRDNO IS NULL  
			  OR AM.IRDNO IS NULL 
			  OR TC.AgentNo=GLA.AgentNo THEN 'FAIL'
			  ELSE
			  CASE
			  WHEN NOT AM.DtTerm IS NULL  
        	  OR LEN(AM.AgentName)<2
        	  OR AM.BankACNumber IS NULL  
        	  OR (NOT (LEN(AM.IFSCCode)=11) AND (NOT UPPER(AM.IFSCCode)='NA'))
			  OR AM.IRDNO IS NULL  
			  OR AM.IRDNO IS NULL 
			  OR AM.IRDNO IS NULL  
			  OR AM.IRDNO IS NULL 
			  OR TC.AgentNo=GLA.AgentNo THEN 'FAIL'
			  ELSE 'PASS'
			  END
			  END
		    ) AS [Validation]
		FROM tblTransactionCash AS TC
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TC.ContestID
		LEFT JOIN tblAgentMaster AS AM
		ON AM.AgentNo=TC.AgentNo
		LEFT JOIN tblGregListAgentNo AS GLA
		ON GLA.AgentNo=TC.AgentNo
		WHERE EXISTS(SELECT AgentTypeName FROM tblCAmap AS CAM
		LEFT JOIN tblAgentTypeMaster AS ATM
		ON CAM.AgntTypeId=ATM.AgntTypeId
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CAM.Cid
		WHERE CUmap.[UId]=COALESCE(@UId,CUmap.[UId]) AND CAM.Cid=CM.Cid)
		AND
		TC.ContestID=@ContestID
		AND
		TC.ValidFlag=1
		AND
		TC.[Status]=1
		AND
		TC.PaymentFlag=1
		AND
		NOT TC.NetPayable=0) AS CWALC
        GROUP BY 
		        ContestID,
				ContestName,
				AgentNo,
				EntryFlag,
		        [Status],
		        AgentName,
		        AGTYPE,
		        IRDNO,
		        DtApp,
		        DtTerm,
		        BranchCode,
		        BankACNumber,
		        IFSCCode,
		        [Validation]
)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFRecoveryRpt]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TVFRecoveryRpt](@AgentNo nvarchar(255),@UId VARCHAR(200))
RETURNS TABLE
AS

RETURN(

SELECT TRC.AgentNo AS [Advisor Code],
	   UWAL.AgentName AS [Advisor Name],
	   UWAL.BranchCode AS [Branch Code],
	   UWAL.DtTerm AS [Date Of Termination ],
	   TRC.OpenRecoverableAmont AS [Open Recoverable Amount]
	   

	   
	FROM tblRecoverableCash AS TRC
	--LEFT JOIN tblAgentMaster AS TAM
	--ON TAM.AgentNo=TRC.AgentNo
	RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS UWAL
	ON UWAL.AgentNo=TRC.AgentNo
	WHERE
	TRC.ValidFlag=1
	AND
	TRC.AgentNo=COALESCE(@AgentNo,TRC.AgentNo) 




)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFTransferwisePayoutRpt]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TVFTransferwisePayoutRpt](@AgentNo nvarchar(255),@TransferStartDate Date,@TransferEndDate Date,@UId VARCHAR(200))
RETURNS TABLE
AS

RETURN(

SELECT TPGC.AgentNo AS [Advisor Code],
	   UWAL.AgentName AS [Advisor Name],
	   UWAL.BranchCode AS [Branch Code],
	   CAST(TPGC.NetPayout AS DECIMAL(30,2))  AS [Gross],
	   CAST(((CAST(5 AS FLOAT)/CAST(100 AS FLOAT))*(TPGC.NetPayout)) AS DECIMAL(30,2)) AS Tax,
	   CAST(((TPGC.NetPayout)-(((CAST(5 AS FLOAT)/CAST(100 AS FLOAT))*(TPGC.NetPayout)))) AS DECIMAL(30,2)) AS [Net],
	   TPGC.TransferDate,
	   UWAL.DtTerm AS [Date Of Termination ],
       TPGC.PRFNo AS [PRF Number],
	   TPGC.PRFComment AS [Contest Names],
       UWAL.AGTYPE AS [AG Type],
       TPGC.Agtypes AS [AG Class],
       TPGC.UTRNO AS [UTR Number]
	FROM tblPRFGenratedCash AS TPGC
	--LEFT JOIN tblAgentMaster AS TAM
	--ON TAM.AgentNo=TPGC.AgentNo
	RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS UWAL
	ON UWAL.AgentNo=TPGC.AgentNo
	WHERE

	TPGC.AgentNo=COALESCE(@AgentNo,TPGC.AgentNo) 
	AND
	TPGC.TransferDate BETWEEN COALESCE(@TransferStartDate,TPGC.TransferDate) AND COALESCE(@TransferEndDate,TPGC.TransferDate)

)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFPRFCashList]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TVFPRFCashList]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(200) ,
	@AgTypeId BIGINT
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
		SELECT 
		TC.AgentNo,
		CONVERT(DATE,GETDATE())  AS TranDate,
		ISNULL(TC.NetPayable,0) AS NetAmount,
		(0) AS RecoverbleAmount,
		(0) AS DeviationAmt,
		(0) AS AdvancePayout,
		(0) AS AdvanceRecoverable,
		(0) AS MaxRecoverableAmt,
		(ISNULL(TC.NetPayable,0)) AS NetPayout,
		(AT.AgID) AS AgClass

		FROM tblTransactionCash AS TC
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TC.ContestID
		LEFT JOIN tblAgType AS AT
		ON AT.Agtypes=CM.AGTYPES
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId AND AT.AgID=@AgTypeId
		AND TC.ValidFlag=1 AND TC.PaymentFlag=1 AND TC.EntryFlag=2 AND TC.[Status]=2

		UNION ALL

		SELECT 
		TC.AgentNo,
		CONVERT(DATE,GETDATE())  AS TranDate,
		(0) AS NetAmount,
		(0) AS RecoverbleAmount,
		ISNULL(TC.NetPayable,0) AS DeviationAmt,
		(0) AS AdvancePayout,
		(0) AS AdvanceRecoverable,
		(0) AS MaxRecoverableAmt,
		(ISNULL(TC.NetPayable,0)) AS NetPayout,
		(AT.AgID) AS AgClass

		FROM tblTransactionCash AS TC
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TC.ContestID
		LEFT JOIN tblAgType AS AT
		ON AT.Agtypes=CM.AGTYPES
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId AND AT.AgID=@AgTypeId
		AND TC.ValidFlag=1 AND TC.PaymentFlag=1 AND TC.EntryFlag=1 AND TC.[Status]=4

		UNION ALL

		SELECT 
		TT.AgentNo,
		CONVERT(DATE,GETDATE())  AS TranDate,
		ISNULL(TT.NetPayable,0) AS NetAmount,
		(0) AS RecoverbleAmount,
		(0) AS DeviationAmt,
		(0) AS AdvancePayout,
		(0) AS AdvanceRecoverable,
		(0) AS MaxRecoverableAmt,
		(ISNULL(TT.NetPayable,0)) AS NetPayout,
		(AT.AgID) AS AgClass

		FROM tblTransactionTickets AS TT
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TT.ContestID
		LEFT JOIN tblAgType AS AT
		ON AT.Agtypes=CM.AGTYPES
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId AND AT.AgID=@AgTypeId
		AND TT.ValidFlag=1 AND TT.PaymentFlag=1 AND TT.EntryFlag=2 AND TT.[Status]=2 AND UPPER(TT.[Option])='C'

		UNION ALL

		SELECT 
		TT.AgentNo,
		CONVERT(DATE,GETDATE())  AS TranDate,
		(0) AS NetAmount,
		(0) AS RecoverbleAmount,
		ISNULL(TT.NetPayable,0) AS DeviationAmt,
		(0) AS AdvancePayout,
		(0) AS AdvanceRecoverable,
		(0) AS MaxRecoverableAmt,
		(ISNULL(TT.NetPayable,0)) AS NetPayout,
		(AT.AgID) AS AgClass

		FROM tblTransactionTickets AS TT
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TT.ContestID
		LEFT JOIN tblAgType AS AT
		ON AT.Agtypes=CM.AGTYPES
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId AND AT.AgID=@AgTypeId
		AND TT.ValidFlag=1 AND TT.PaymentFlag=1 AND TT.EntryFlag=1 AND TT.[Status]=4 AND UPPER(TT.[Option])='C'

		---------------

		UNION ALL

		SELECT 
		TT.AgentNo,
		CONVERT(DATE,GETDATE())  AS TranDate,
		ISNULL(TT.NetPayable,0) AS NetAmount,
		(0) AS RecoverbleAmount,
		(0) AS DeviationAmt,
		(0) AS AdvancePayout,
		(0) AS AdvanceRecoverable,
		(0) AS MaxRecoverableAmt,
		(ISNULL(TT.NetPayable,0)) AS NetPayout,
		(AT.AgID) AS AgClass

		FROM tblTransactionTickets AS TT
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TT.ContestID
		LEFT JOIN tblAgType AS AT
		ON AT.Agtypes=CM.AGTYPES
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId AND AT.AgID=@AgTypeId
		AND TT.ValidFlag=1 AND TT.PaymentFlag=1 AND TT.EntryFlag=2 AND TT.[Status]=2 AND UPPER(TT.[Option])='T' AND ((ISNULL(TT.NetPayable,0))<0)

		UNION ALL

		SELECT 
		TT.AgentNo,
		CONVERT(DATE,GETDATE())  AS TranDate,
		(0) AS NetAmount,
		(0) AS RecoverbleAmount,
		ISNULL(TT.NetPayable,0) AS DeviationAmt,
		(0) AS AdvancePayout,
		(0) AS AdvanceRecoverable,
		(0) AS MaxRecoverableAmt,
		(ISNULL(TT.NetPayable,0)) AS NetPayout,
		(AT.AgID) AS AgClass

		FROM tblTransactionTickets AS TT
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TT.ContestID
		LEFT JOIN tblAgType AS AT
		ON AT.Agtypes=CM.AGTYPES
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId AND AT.AgID=@AgTypeId
		AND TT.ValidFlag=1 AND TT.PaymentFlag=1 AND TT.EntryFlag=1 AND TT.[Status]=4 AND UPPER(TT.[Option])='T' AND ((ISNULL(TT.NetPayable,0))<0)

        UNION ALL
        
		SELECT 
		APC.AgentNo,
		CONVERT(DATE,GETDATE())  AS TranDate,
		(0) AS NetAmount,
		(0) AS RecoverbleAmount,
		(0) AS DeviationAmt,
		(APC.Amount) AS AdvancePayout,
		(CASE  WHEN (ISNULL(APC.MaxRecoverblePerCycle,0))>=(ISNULL(APC.NetBalance,0)) THEN (ISNULL(APC.NetBalance,0)) ELSE (ISNULL(APC.MaxRecoverblePerCycle,0)) END) AS AdvanceRecoverable,
		(ISNULL(APC.MaxRecoverblePerCycle,0)) AS MaxRecoverableAmt,
		(CASE  WHEN (ISNULL(APC.MaxRecoverblePerCycle,0))>=(ISNULL(APC.Amount,0)) THEN (ISNULL(APC.Amount,0)) ELSE (ISNULL(APC.MaxRecoverblePerCycle,0)) END) AS NetPayout,
		(0) AS AgClass
        
		FROM tblAdvancePayCash as APC
		RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS UWAL
		ON UWAL.AgentNo=APC.AgentNo
		WHERE APC.[Status]=2 AND APC.ValidFlag=1 AND (UPPER(APC.PayRecoverFlag)='R') AND APC.PaymentFlag=1 AND APC.NetBalance>0
		AND ((CAST(YEAR(GETDATE()) AS BIGINT)*100+MONTH(GETDATE()))*100+DAY(GETDATE()))>APC.EffectiveStartDateForRecovery
        
        UNION ALL
        
		SELECT  
		RC.AgentNo,
		CONVERT(DATE,GETDATE())  AS TranDate,
		(0) AS NetAmount,
		(ISNULL(RC.OpenRecoverableAmont,0)) AS RecoverbleAmount,
		(0) AS DeviationAmt,
		(0) AS AdvancePayout,
		(0) AS AdvanceRecoverable,
		(0) AS MaxRecoverableAmt,
		(ISNULL(RC.OpenRecoverableAmont,0)) AS NetPayout,
		(0) AS AgClass
		FROM tblRecoverableCash AS RC
		RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS UWAL
		ON UWAL.AgentNo=RC.AgentNo
		WHERE RC.ValidFlag=1 AND RC.RecoveredFlag=1

)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFPRFAdvancePayList]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TVFPRFAdvancePayList]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(200)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
		SELECT
		APC.AgentNo,
		CONVERT(DATE,GETDATE())  AS TranDate,
		(0) AS NetAmount,
		(0) AS RecoverbleAmount,
		(0) AS DeviationAmt,
		(APC.Amount) AS AdvancePayout,
		(0) AS AdvanceRecoverable,
		(ISNULL(APC.MaxRecoverblePerCycle,0)) AS MaxRecoverableAmt,
		(APC.Amount)  AS NetPayout,
		(0) AS AgClass
        
		FROM tblAdvancePayCash as APC
		RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS UWAL
		ON UWAL.AgentNo=APC.AgentNo
		WHERE APC.[Status]=2 AND APC.ValidFlag=1 AND (UPPER(APC.PayRecoverFlag)='P') AND APC.PaymentFlag=1
		
        

)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFPendingRpt]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TVFPendingRpt](@AgentNo nvarchar(255),@StartDateS int,@EndDateS int,@StartDateE int,@EndDateE int,@UId VARCHAR(200))
RETURNS TABLE
AS

RETURN(
SELECT * FROM (
SELECT TTC.AgentNo AS [Advisor Code],
       UWAL.AgentName AS [Advisor Name],
	   UWAL.BranchCode AS [Branch Code],
	   TCM.AGTYPES AS [Agent Class],
	   TTC.NetPayable AS [Gross Amount],
	   UWAL.BankACNumber AS [Account Number],
	   UWAL.IFSCCode AS [IFSC Code],
	   UWAL.IRDNO AS [PAN Number],
	   UWAL.DtTerm AS [Date Of Termination ],
	   TCM.ContestID AS [Contest ID],
	   TCM.ContestName AS [Contest Name],
	   dbo.[SVFDateSerial](LEFT(TCM.StartDate,4), SUBSTRING(CAST(TCM.StartDate AS VARCHAR ),5,2),RIGHT(TCM.StartDate,2)) AS [Contest Start Date],
	   dbo.[SVFDateSerial](LEFT(TCM.EndDate,4), SUBSTRING(CAST(TCM.EndDate AS VARCHAR ),5,2),RIGHT(TCM.EndDate,2)) AS [Contest End Date],
	   (NULL) AS [Option] ,
	   CASE WHEN UWAL.DtTerm IS NOT NULL OR UWAL.AgentName IS NULL OR UWAL.BankACNumber IS NULL OR UWAL.IFSCCode IS NULL OR UWAL.IRDNO IS NULL   THEN 'FAIL' ELSE 'PASS' END AS [Validate],
	   CASE	WHEN TGA.AgentNo IS NULL THEN 'NO' ELSE 'YES' END [Greglist]
	   
	FROM tbltransactionCash AS TTC
	JOIN tblContestMaster AS TCM
	ON TCM.ContestID=TTC.ContestID
	RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS UWAL
	ON UWAL.AgentNo=TTC.AgentNo
	--LEFT JOIN tblAgentMaster AS TAM
	--ON TAM.AgentNo=TTC.AgentNo
	RIGHT JOIN tblCUmap AS TCUM
	ON TCUM.Cid=TCM.CID
	LEFT JOIN tblGregListAgentNo AS TGA
	ON TGA.AgentNo=TTC.AgentNo
	WHERE
	TTC.ValidFlag=1 AND TTC.Status=0 AND TTC.PaymentFlag=1 AND TTC.NetPayable<>0
	AND
	TTC.AgentNo=COALESCE(@AgentNo,TTC.AgentNo) 
	AND
	TCM.StartDate BETWEEN COALESCE(@StartDateS,TCM.StartDate) AND COALESCE(@StartDateE,TCM.StartDate)
	AND
	TCM.EndDate BETWEEN COALESCE(@EndDateS,TCM.EndDate) AND COALESCE(@EndDateE,TCM.EndDate)

UNION ALL

SELECT TTT.AgentNo AS [Advisor Code],
       TUWAL.AgentName AS [Advisor Name],
	   TUWAL.BranchCode AS [Branch Code],
	   TCMT.AGTYPES AS [Agent Class],
	   TTT.NetPayable AS [Gross Amount],
	   TUWAL.BankACNumber AS [Account Number],
	   TUWAL.IFSCCode AS [IFSC Code],
	   TUWAL.IRDNO AS [PAN Number],
	   TUWAL.DtTerm AS [Date Of Termination ],
	   TCMT.ContestID AS [Contest ID],
	   TCMT.ContestName AS [Contest Name],
	   dbo.[SVFDateSerial](LEFT(TCMT.StartDate,4), SUBSTRING(CAST(TCMT.StartDate AS VARCHAR ),5,2),RIGHT(TCMT.StartDate,2)) AS [Contest Start Date],
	   dbo.[SVFDateSerial](LEFT(TCMT.EndDate,4), SUBSTRING(CAST(TCMT.EndDate AS VARCHAR ),5,2),RIGHT(TCMT.EndDate,2)) AS [Contest End Date],
	   TTT.[Option] AS [Option] ,
	   CASE WHEN TUWAL.DtTerm IS NOT NULL OR TUWAL.AgentName IS NULL OR TUWAL.BankACNumber IS NULL OR TUWAL.IFSCCode IS NULL OR TUWAL.IRDNO IS NULL  THEN 'FAIL' ELSE 'PASS' END AS [Validate],
	   CASE	WHEN TGAT.AgentNo IS NULL THEN 'NO' ELSE 'YES' END [Greglist]
	   
	FROM tblTransactionTickets AS TTT
	JOIN tblContestMaster AS TCMT
	ON TCMT.ContestID=TTT.ContestID
	--LEFT JOIN tblAgentMaster AS TAMT
	--ON TAMT.AgentNo=TTT.AgentNo
	RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS TUWAL
	ON TUWAL.AgentNo=TTT.AgentNo
	RIGHT JOIN tblCUmap AS TCUM
	ON TCUM.Cid=TCMT.CID
	LEFT JOIN tblGregListAgentNo AS TGAT
	ON TGAT.AgentNo=TTT.AgentNo
	WHERE
	TTT.ValidFlag=1 AND TTT.Status=0 AND TTT.PaymentFlag=1 AND TTT.NetPayable<>0
	AND
	TTT.AgentNo=COALESCE(@AgentNo,TTT.AgentNo) 
	AND
	TCMT.StartDate BETWEEN COALESCE(@StartDateS,TCMT.StartDate) AND COALESCE(@StartDateE,TCMT.StartDate)
	AND
	TCMT.EndDate BETWEEN COALESCE(@EndDateS,TCMT.EndDate) AND COALESCE(@EndDateE,TCMT.EndDate)
	)AS PNDData
	GROUP BY 
	[Advisor Code],[Advisor Name],[Branch Code],[Agent Class],[Gross Amount],[Account Number],[IFSC Code],[PAN Number],[Date Of Termination ],[Contest ID],[Contest Name],[Contest Start Date],[Contest End Date],[Option] ,[Validate],[Greglist]
)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFDeviationRpt]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TVFDeviationRpt](@ContestID decimal(20, 0),@LoadDateS int,@LoadDateE int,@UId VARCHAR(200))
RETURNS TABLE
AS

RETURN(



SELECT TTC.AgentNo AS [Advisor Code],
       UWAL.AgentName AS [Advisor Name],
	   UWAL.BranchCode AS [Branch Code],
	   TCM.AGTYPES AS [Agent Class],
	   TTC.PreviousNetPayable AS [Original Payable],
	   TTC.NetPayable AS [Diffrence Payout],
	   TCM.ContestID AS [Contest ID],
	   TCM.ContestName AS [Contest Name],
	   dbo.[SVFDateSerial](LEFT(TCM.StartDate,4), SUBSTRING(CAST(TCM.StartDate AS VARCHAR ),5,2),RIGHT(TCM.StartDate,2)) AS [Contest Start Date],
	   dbo.[SVFDateSerial](LEFT(TCM.EndDate,4), SUBSTRING(CAST(TCM.EndDate AS VARCHAR ),5,2),RIGHT(TCM.EndDate,2)) AS [Contest End Date],
	   (NULL) AS [Option] ,
	   TTC.Remarks AS [Remarks]
	   
	   
	FROM tbltransactionCash AS TTC
	JOIN tblContestMaster AS TCM
	ON TCM.ContestID=TTC.ContestID
	--LEFT JOIN tblAgentMaster AS TAM
	--ON TAM.AgentNo=TTC.AgentNo
	RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS UWAL
	ON UWAL.AgentNo=TTC.AgentNo
	RIGHT JOIN tblCUmap AS TCUM
	ON TCUM.Cid=TCM.CID
	LEFT JOIN tblGregListAgentNo AS TGA
	ON TGA.AgentNo=TTC.AgentNo
	WHERE
	TTC.EntryFlag=1 AND TTC.PaymentFlag=2 AND TTC.Status=8 
	AND
	TTC.ContestID=COALESCE(@ContestID,TTC.ContestID) 
	AND
	TTC.LoadDate BETWEEN COALESCE(@LoadDateS,TTC.LoadDate) AND COALESCE(@LoadDateE,TTC.LoadDate)
	AND 
	TCUM.UId=@UId

UNION ALL

SELECT TTC.AgentNo AS [Advisor Code],
       UWAL.AgentName AS [Advisor Name],
	   UWAL.BranchCode AS [Branch Code],
	   TCM.AGTYPES AS [Agent Class],
	   TTC.PreviousNetPayable AS [Original Payable],
	   TTC.NetPayable AS [Diffrence Payout],
	   TCM.ContestID AS [Contest ID],
	   TCM.ContestName AS [Contest Name],
	   dbo.[SVFDateSerial](LEFT(TCM.StartDate,4), SUBSTRING(CAST(TCM.StartDate AS VARCHAR ),5,2),RIGHT(TCM.StartDate,2)) AS [Contest Start Date],
	   dbo.[SVFDateSerial](LEFT(TCM.EndDate,4), SUBSTRING(CAST(TCM.EndDate AS VARCHAR ),5,2),RIGHT(TCM.EndDate,2)) AS [Contest End Date],
	   (NULL) AS [Option],
	   TTC.Remarks AS [Remarks] 
	   
	FROM tbltransactionCash AS TTC
	JOIN tblContestMaster AS TCM
	ON TCM.ContestID=TTC.ContestID
	RIGHT JOIN tblCUmap AS TCUM
	ON TCUM.Cid=TCM.CID
	--LEFT JOIN tblAgentMaster AS TAM
	--ON TAM.AgentNo=TTC.AgentNo
	RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS UWAL
	ON UWAL.AgentNo=TTC.AgentNo
	LEFT JOIN tblGregListAgentNo AS TGA
	ON TGA.AgentNo=TTC.AgentNo
	WHERE
	TTC.ValidFlag=1 AND TTC.EntryFlag=1 AND TTC.PaymentFlag=1 AND TTC.Status in (0,1,2) 
	AND
	TTC.ContestID=COALESCE(@ContestID,TTC.ContestID) 
	AND
	TTC.LoadDate BETWEEN COALESCE(@LoadDateS,TTC.LoadDate) AND COALESCE(@LoadDateE,TTC.LoadDate)
	AND 
	TCUM.UId=@UId
	
		UNION ALL

SELECT TTT.AgentNo AS [Advisor Code],
       UWAL.AgentName AS [Advisor Name],
	   UWAL.BranchCode AS [Branch Code],
	   TCM.AGTYPES AS [Agent Class],
	   TTT.PreviousNetPayable AS [Original Payable],
	   TTT.NetPayable AS [Diffrence Payout],
	   TCM.ContestID AS [Contest ID],
	   TCM.ContestName AS [Contest Name],
	   dbo.[SVFDateSerial](LEFT(TCM.StartDate,4), SUBSTRING(CAST(TCM.StartDate AS VARCHAR ),5,2),RIGHT(TCM.StartDate,2)) AS [Contest Start Date],
	   dbo.[SVFDateSerial](LEFT(TCM.EndDate,4), SUBSTRING(CAST(TCM.EndDate AS VARCHAR ),5,2),RIGHT(TCM.EndDate,2)) AS [Contest End Date],
	   [Option] AS [Option],
	   TTT.Remarks AS [Remarks]
	   
	FROM tblTransactionTickets AS TTT
	JOIN tblContestMaster AS TCM
	ON TCM.ContestID=TTT.ContestID
	RIGHT JOIN tblCUmap AS TCUM
	ON TCUM.Cid=TCM.CID
	--LEFT JOIN tblAgentMaster AS TAM
	--ON TAM.AgentNo=TTT.AgentNo
	RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS UWAL
	ON UWAL.AgentNo=TTT.AgentNo
	LEFT JOIN tblGregListAgentNo AS TGA
	ON TGA.AgentNo=TTT.AgentNo
	WHERE
	
	TTT.EntryFlag=1 AND TTT.PaymentFlag=2 AND TTT.Status=8 
	AND
	TTT.ContestID=COALESCE(@ContestID,TTT.ContestID) 
	AND
	TTT.LoadDate BETWEEN COALESCE(@LoadDateS,TTT.LoadDate) AND COALESCE(@LoadDateE,TTT.LoadDate)
    AND 
	TCUM.UId=@UId
	
	
	UNION ALL

SELECT TTT.AgentNo AS [Advisor Code],
       UWAL.AgentName AS [Advisor Name],
	   UWAL.BranchCode AS [Branch Code],
	   TCM.AGTYPES AS [Agent Class],
	   TTT.PreviousNetPayable AS [Original Payable],
	   TTT.NetPayable AS [Diffrence Payout],
	   TCM.ContestID AS [Contest ID],
	   TCM.ContestName AS [Contest Name],
	   dbo.[SVFDateSerial](LEFT(TCM.StartDate,4), SUBSTRING(CAST(TCM.StartDate AS VARCHAR ),5,2),RIGHT(TCM.StartDate,2)) AS [Contest Start Date],
	   dbo.[SVFDateSerial](LEFT(TCM.EndDate,4), SUBSTRING(CAST(TCM.EndDate AS VARCHAR ),5,2),RIGHT(TCM.EndDate,2)) AS [Contest End Date],
	   [Option] AS [Option] ,
	   TTT.Remarks AS [Remarks]
	   
	FROM tblTransactionTickets AS TTT
	JOIN tblContestMaster AS TCM
	ON TCM.ContestID=TTT.ContestID
	RIGHT JOIN tblCUmap AS TCUM
	ON TCUM.Cid=TCM.CID
	--LEFT JOIN tblAgentMaster AS TAM
	--ON TAM.AgentNo=TTT.AgentNo
	RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS UWAL
	ON UWAL.AgentNo=TTT.AgentNo
	LEFT JOIN tblGregListAgentNo AS TGA
	ON TGA.AgentNo=TTT.AgentNo
	WHERE
	TTT.ValidFlag=1 AND TTT.EntryFlag=1 AND TTT.PaymentFlag=1 AND TTT.Status in (0,1,2) 
	AND
	TTT.ContestID=COALESCE(@ContestID,TTT.ContestID) 
	AND
	TTT.LoadDate BETWEEN COALESCE(@LoadDateS,TTT.LoadDate) AND COALESCE(@LoadDateE,TTT.LoadDate)
    AND 
	TCUM.UId=@UId

)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFContestQualifiersRpt]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TVFContestQualifiersRpt](@AgentNo nvarchar(255),@StartDateS int,@EndDateS int,@StartDateE int,@EndDateE int,@UId VARCHAR(200))
RETURNS TABLE
AS

RETURN(

SELECT TTC.AgentNo AS [Advisor Code],
       UWAL.AgentName AS [Advisor Name],
	   UWAL.AGTYPE AS [AG Type],
	   TCM.AGTYPES AS [Agent Class],
	   TTC.NetPayable AS [Amount],
	   UWAL.BranchCode AS [Branch Code],
	   UWAL.DtTerm AS [Date Of Termination],
	   TCM.ContestID AS [Contest ID],
	   TCM.ContestName AS [Contest Name],
	   dbo.[SVFDateSerial](LEFT(TCM.StartDate,4), SUBSTRING(CAST(TCM.StartDate AS VARCHAR ),5,2),RIGHT(TCM.StartDate,2)) AS [Contest Start Date],
	   dbo.[SVFDateSerial](LEFT(TCM.EndDate,4), SUBSTRING(CAST(TCM.EndDate AS VARCHAR ),5,2),RIGHT(TCM.EndDate,2)) AS [Contest End Date],
	   CASE WHEN TTC.PaymentFlag=1 THEN 'NOT PAID' WHEN TTC.PaymentFlag=2 THEN 'PAID' END  AS [Payout Status] 
	   
	   
	FROM tbltransactionCash AS TTC
	JOIN tblContestMaster AS TCM
	ON TCM.ContestID=TTC.ContestID
	--LEFT JOIN tblAgentMaster AS TAM
	--ON TAM.AgentNo=TTC.AgentNo
	RIGHT JOIN tblCUmap AS TCUM
	ON TCUM.Cid=TCM.CID
	RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS UWAL
	ON UWAL.AgentNo=TTC.AgentNo
	--LEFT JOIN tblGregListAgentNo AS TGA
	--ON TGA.AgentNo=TTC.AgentNo
	WHERE
	TTC.EntryFlag=2 AND TTC.CycleCount=1 AND TTC.NetPayable<>0
	AND
	TTC.AgentNo=COALESCE(@AgentNo,TTC.AgentNo) 
	AND
	TCM.StartDate BETWEEN COALESCE(@StartDateS,TCM.StartDate) AND COALESCE(@StartDateE,TCM.StartDate)
	AND
	TCM.EndDate BETWEEN COALESCE(@EndDateS,TCM.EndDate) AND COALESCE(@EndDateE,TCM.EndDate)
	AND 
	TCUM.[UId]=@UId
	
	UNION ALL
	
	SELECT TTC.AgentNo AS [Advisor Code],
       UWAL.AgentName AS [Advisor Name],
	   UWAL.AGTYPE AS [AG Type],
	   TCM.AGTYPES AS [Agent Class],
	   TTC.NetPayable AS [Amount],
	   UWAL.BranchCode AS [Branch Code],
	   UWAL.DtTerm AS [Date Of Termination],
	   TCM.ContestID AS [Contest ID],
	   TCM.ContestName AS [Contest Name],
	   dbo.[SVFDateSerial](LEFT(TCM.StartDate,4), SUBSTRING(CAST(TCM.StartDate AS VARCHAR ),5,2),RIGHT(TCM.StartDate,2)) AS [Contest Start Date],
	   dbo.[SVFDateSerial](LEFT(TCM.EndDate,4), SUBSTRING(CAST(TCM.EndDate AS VARCHAR ),5,2),RIGHT(TCM.EndDate,2)) AS [Contest End Date],
	   CASE WHEN TTC.PaymentFlag=1 THEN 'NOT PAID' WHEN TTC.PaymentFlag=2 THEN 'PAID' END  AS [Payout Status] 
	   
	   
	FROM tbltransactionCash AS TTC
	JOIN tblContestMaster AS TCM
	ON TCM.ContestID=TTC.ContestID
	RIGHT JOIN tblCUmap AS TCUM
	ON TCUM.Cid=TCM.CID
	--LEFT JOIN tblAgentMaster AS TAM
	--ON TAM.AgentNo=TTC.AgentNo
	RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS UWAL
	ON UWAL.AgentNo=TTC.AgentNo
	--LEFT JOIN tblGregListAgentNo AS TGA
	--ON TGA.AgentNo=TTC.AgentNo
	WHERE
	TTC.EntryFlag=1  AND TTC.NetPayable<>0 
	AND
	TTC.AgentNo=COALESCE(@AgentNo,TTC.AgentNo) 
	AND
	TCM.StartDate BETWEEN COALESCE(@StartDateS,TCM.StartDate) AND COALESCE(@StartDateE,TCM.StartDate)
	AND
	TCM.EndDate BETWEEN COALESCE(@EndDateS,TCM.EndDate) AND COALESCE(@EndDateE,TCM.EndDate)
	AND
	TTC.LoadDate = (SELECT MAX(LoadDate) FROM tbltransactionCash AS STC WHERE STC.EntryFlag=1 AND STC.ContestID=TTC.ContestID AND STC.AgentNo=TTC.AgentNo AND STC.NetPayable<>0)
	AND 
	TCUM.[UId]=@UId
	
	UNION ALL
	
	

SELECT TTT.AgentNo AS [Advisor Code],
       UWAL.AgentName AS [Advisor Name],
	   UWAL.AGTYPE AS [AG Type],
	   TCM.AGTYPES AS [Agent Class],
	   TTT.NetPayable AS [Amount],
	   UWAL.BranchCode AS [Branch Code],
	   UWAL.DtTerm AS [Date Of Termination],
	   TCM.ContestID AS [Contest ID],
	   TCM.ContestName AS [Contest Name],
	   dbo.[SVFDateSerial](LEFT(TCM.StartDate,4), SUBSTRING(CAST(TCM.StartDate AS VARCHAR ),5,2),RIGHT(TCM.StartDate,2)) AS [Contest Start Date],
	   dbo.[SVFDateSerial](LEFT(TCM.EndDate,4), SUBSTRING(CAST(TCM.EndDate AS VARCHAR ),5,2),RIGHT(TCM.EndDate,2)) AS [Contest End Date],
	   CASE WHEN TTT.PaymentFlag=1 THEN 'NOT PAID' WHEN TTT.PaymentFlag=2 THEN 'PAID' END  AS [Payout Status] 
	   
	   
	FROM tblTransactionTickets AS TTT
	JOIN tblContestMaster AS TCM
	ON TCM.ContestID=TTT.ContestID
	RIGHT JOIN tblCUmap AS TCUM
	ON TCUM.Cid=TCM.CID
	--LEFT JOIN tblAgentMaster AS TAM
	--ON TAM.AgentNo=TTT.AgentNo
	RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS UWAL
	ON UWAL.AgentNo=TTT.AgentNo
	--LEFT JOIN tblGregListAgentNo AS TGA
	--ON TGA.AgentNo=TTT.AgentNo
	WHERE
	TTT.EntryFlag=2 AND TTT.CycleCount=1 AND TTT.NetPayable<>0
	AND
	TTT.AgentNo=COALESCE(@AgentNo,TTT.AgentNo) 
	AND
	TCM.StartDate BETWEEN COALESCE(@StartDateS,TCM.StartDate) AND COALESCE(@StartDateE,TCM.StartDate)
	AND
	TCM.EndDate BETWEEN COALESCE(@EndDateS,TCM.EndDate) AND COALESCE(@EndDateE,TCM.EndDate)
	AND 
	TCUM.[UId]=@UId
	
	UNION ALL
	
	SELECT TTT.AgentNo AS [Advisor Code],
       UWAL.AgentName AS [Advisor Name],
	   UWAL.AGTYPE AS [AG Type],
	   TCM.AGTYPES AS [Agent Class],
	   TTT.NetValue AS [Amount],
	   UWAL.BranchCode AS [Branch Code],
	   UWAL.DtTerm AS [Date Of Termination],
	   TCM.ContestID AS [Contest ID],
	   TCM.ContestName AS [Contest Name],
	   dbo.[SVFDateSerial](LEFT(TCM.StartDate,4), SUBSTRING(CAST(TCM.StartDate AS VARCHAR ),5,2),RIGHT(TCM.StartDate,2)) AS [Contest Start Date],
	   dbo.[SVFDateSerial](LEFT(TCM.EndDate,4), SUBSTRING(CAST(TCM.EndDate AS VARCHAR ),5,2),RIGHT(TCM.EndDate,2)) AS [Contest End Date],
	   CASE WHEN TTT.PaymentFlag=1 THEN 'NOT PAID' WHEN TTT.PaymentFlag=2 THEN 'PAID' END  AS [Payout Status] 
	   
	   
	FROM tblTransactionTickets AS TTT
	JOIN tblContestMaster AS TCM
	ON TCM.ContestID=TTT.ContestID
	RIGHT JOIN tblCUmap AS TCUM
	ON TCUM.Cid=TCM.CID
	--LEFT JOIN tblAgentMaster AS TAM
	--ON TAM.AgentNo=TTT.AgentNo
	RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS UWAL
	ON UWAL.AgentNo=TTT.AgentNo
	--LEFT JOIN tblGregListAgentNo AS TGA
	--ON TGA.AgentNo=TTT.AgentNo
	WHERE
	TTT.EntryFlag=1 AND TTT.NetPayable<>0
	AND
	TTT.AgentNo=COALESCE(@AgentNo,TTT.AgentNo) 
	AND
	TCM.StartDate BETWEEN COALESCE(@StartDateS,TCM.StartDate) AND COALESCE(@StartDateE,TCM.StartDate)
	AND
	TCM.EndDate BETWEEN COALESCE(@EndDateS,TCM.EndDate) AND COALESCE(@EndDateE,TCM.EndDate)
	AND
	TTT.LoadDate = (SELECT MAX(LoadDate) FROM tblTransactionTickets AS STT WHERE STT.EntryFlag=1 AND STT.ContestID=TTT.ContestID AND STT.AgentNo=TTT.AgentNo AND STT.NetPayable<>0 )
	AND 
	TCUM.[UId]=@UId
	
	)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFCashApprove2List]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TVFCashApprove2List]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(200) 
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
			SELECT TC.PRFNoGenREF, TC.PRFNo, TC.PRFGENDate, TC.PRFAmount, TC.Status
        FROM tblTransactionCash AS TC
		
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TC.ContestID
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId 
		AND TC.ValidFlag>=1 AND TC.PaymentFlag=2 AND (TC.EntryFlag) in (1,2) AND TC.[Status]=6
		
		
		UNION
		
		SELECT TT.PRFNoGenREF, TT.PRFNo, TT.PRFGENDate, TT.PRFAmount, TT.Status
		FROM tblTransactionTickets AS TT
		
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TT.ContestID
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId 
		AND TT.ValidFlag>=1 AND TT.PaymentFlag=2 AND (TT.EntryFlag) in (1,2) AND TT.[Status]=6
		AND UPPER(TT.[Option])='C'
		
		UNION
		
		SELECT TT.PRFNoGenREF, TT.PRFNo, TT.PRFGENDate, TT.PRFAmount, TT.Status
		FROM tblTransactionTickets AS TT
		
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TT.ContestID
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId 
		AND TT.ValidFlag>=1 AND TT.PaymentFlag=2 AND (TT.EntryFlag) in (1,2) AND TT.[Status]=6
		AND UPPER(TT.[Option])='T' AND TT.NetPayable<0
		
		UNION
		
		
		SELECT APC.PRFNoGenREF, APC.PRFNo, APC.PRFGENDate, APC.PRFAmount, APC.Status
		FROM tblAdvancePayCash as APC
		RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS UWAL
		ON UWAL.AgentNo=APC.AgentNo
		WHERE (((APC.[Status])=6) AND ((APC.ValidFlag)>=1) AND ((APC.PaymentFlag)=2) )


)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFCashApprove1List]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TVFCashApprove1List]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(200) 
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
			SELECT TC.PRFNoGenREF, TC.PRFNo, TC.PRFGENDate, TC.PRFAmount, TC.[Status]
        FROM tblTransactionCash AS TC
		
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TC.ContestID
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId 
		AND TC.ValidFlag>=1 AND TC.PaymentFlag=2 AND (TC.EntryFlag) in (1,2) AND TC.[Status]=5
		
		
		UNION
		
		SELECT TT.PRFNoGenREF, TT.PRFNo, TT.PRFGENDate, TT.PRFAmount, TT.[Status]
		FROM tblTransactionTickets AS TT
		
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TT.ContestID
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId 
		AND TT.ValidFlag>=1 AND TT.PaymentFlag=2 AND (TT.EntryFlag) in (1,2) AND TT.[Status]=5
		AND UPPER(TT.[Option])='C'
		
		UNION
		
		SELECT TT.PRFNoGenREF, TT.PRFNo, TT.PRFGENDate, TT.PRFAmount, TT.Status
		FROM tblTransactionTickets AS TT
		
		LEFT JOIN tblContestMaster AS CM
		ON CM.ContestID=TT.ContestID
		LEFT JOIN tblCUmap AS CUmap
		ON CUmap.Cid=CM.Cid
		WHERE CUmap.[UId]=@UId 
		AND TT.ValidFlag>=1 AND TT.PaymentFlag=2 AND (TT.EntryFlag) in (1,2) AND TT.[Status]=5
		AND UPPER(TT.[Option])='T' AND TT.NetPayable<0
		
		UNION
		
		
		SELECT APC.PRFNoGenREF, APC.PRFNo, APC.PRFGENDate, APC.PRFAmount, APC.Status
		FROM tblAdvancePayCash as APC
		RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS UWAL
		ON UWAL.AgentNo=APC.AgentNo
		WHERE (((APC.Status)=5) AND ((APC.ValidFlag)>=1) AND ((APC.PaymentFlag)=2) )


)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFAdvanceWithPaymntRpt]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TVFAdvanceWithPaymntRpt](@AgentNo nvarchar(255),@UId VARCHAR(200))
RETURNS TABLE
AS

RETURN(



SELECT TAPC.AgentNo AS [Advisor Code],
       UWAL.AgentName AS [Advisor Name],
	   UWAL.BranchCode AS [Branch Code],
	   dbo.[SVFDateSerial](LEFT(TAPC.EffectiveStartDateForRecovery,4), SUBSTRING(CAST(TAPC.EffectiveStartDateForRecovery AS VARCHAR ),5,2),RIGHT(TAPC.EffectiveStartDateForRecovery,2)) AS [Effective StartDate For Recovery],
	   TAPC.Amount AS [Amount],
	   CASE WHEN TAPC.Recoverable=1 THEN 'YES' WHEN TAPC.Recoverable=0 THEN 'NO' END AS [Recoverable],
	   TAPC.MaxRecoverblePerCycle AS [Max Recoverble Per Cycle],
	   TAPC.PRFNo AS [PRF Number],
	   TPGC.PRFComment AS [Contest Names],
	   CASE WHEN TAPC.PayRecoverFlag='P' THEN 'CREDIT' WHEN TAPC.PayRecoverFlag='R' THEN 'DEBIT' END AS [Transaction Type],
	   TAPC.NetRecovered AS [Recovered Amount],
	   CASE WHEN TAPC.NetBalance>=0 AND TAPC.NetBalance<1 THEN 0 ELSE TAPC.NetBalance END AS [Net Balance]
	   
	   
	FROM tblAdvancePayCash AS TAPC
	--LEFT JOIN tblAgentMaster AS TAM
	--ON TAM.AgentNo=TAPC.AgentNo
	RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS UWAL
	ON UWAL.AgentNo=TAPC.AgentNo
	LEFT JOIN tblPRFGenratedCash AS TPGC
	ON TPGC.PRFNoGenREF=TAPC.PRFNoGenREF AND TPGC.AgentNo=TAPC.AgentNo
	
	WHERE
	TAPC.ValidFlag>0 
	AND
	TAPC.AgentNo=COALESCE(@AgentNo,TAPC.AgentNo) 
	
	
	
	
 
 )
GO
/****** Object:  UserDefinedFunction [dbo].[TVFAdvanceWithoutPaymntRpt]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TVFAdvanceWithoutPaymntRpt](@AgentNo nvarchar(255),@UId VARCHAR(200))
RETURNS TABLE
AS

RETURN(

	
	SELECT TAPC.AgentNo AS [Advisor Code],
		   UWAL.AgentName AS [Advisor Name],
		   UWAL.BranchCode AS [Branch Code],	
	       TAPC.EffectiveStartDateForRecovery AS [Effective StartDate For Recovery],
	       TAPC.Amount AS [Amount],
	       TAPC.Recoverable AS [Recoverable],
	       TAPC.MaxRecoverblePerCycle AS [Max Recoverble Per Cycle],
	       TAPC.NetBalance AS [Net Balance]
     FROM tblAdvancePayCash AS TAPC
     RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS UWAL
	 ON UWAL.AgentNo=TAPC.AgentNo
     --LEFT JOIN tblAgentMaster AS TAM
	 --ON TAM.AgentNo=TAPC.AgentNo
WHERE 
	TAPC.NetBalance>0
	AND
	TAPC.ValidFlag=1
	AND
	TAPC.[Status]=2
	AND
	TAPC.AgentNo=COALESCE(@AgentNo,TAPC.AgentNo) 

	
	
 
 )
GO
/****** Object:  UserDefinedFunction [dbo].[TVFAdvanceAgentsListsCheker]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TVFAdvanceAgentsListsCheker]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(200)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	
		SELECT APC.AgentNo,APC.AdvDate,APC.EffectiveStartDateForRecovery,APC.Amount,APC.Recoverable,APC.Remarks,APC.MaxRecoverblePerCycle,APC.NetBalance,APC.Approver1Remarks,APC.Approver2Remarks FROM tblAdvancePayCash as APC
		RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS UWAL
		ON UWAL.AgentNo=APC.AgentNo
		WHERE APC.ValidFlag=1 AND APC.[Status]=1 
		AND APC.PaymentFlag=1
)
GO
/****** Object:  UserDefinedFunction [dbo].[TVFAdvanceAgentsLists]    Script Date: 04/20/2018 17:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TVFAdvanceAgentsLists]
(	
	-- Add the parameters for the function here
	@UId VARCHAR(200)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	
		SELECT APC.AgentNo,APC.AdvDate,APC.EffectiveStartDateForRecovery,APC.Amount,APC.Recoverable,APC.Remarks,APC.MaxRecoverblePerCycle,APC.NetBalance FROM tblAdvancePayCash as APC
		RIGHT JOIN TVFUserWiseAgentsLists(@UId) AS UWAL
		ON UWAL.AgentNo=APC.AgentNo
		WHERE APC.ValidFlag=1 AND APC.[Status]=0 AND UPPER(APC.PayRecoverFlag)='P'
		AND APC.PaymentFlag=1

)
GO
/****** Object:  Default [DF__ExideCont__Valid__060DEAE8]    Script Date: 04/20/2018 17:36:34 ******/
ALTER TABLE [dbo].[ExideContest] ADD  CONSTRAINT [DF__ExideCont__Valid__060DEAE8]  DEFAULT ('U') FOR [Valid Flag]
GO
/****** Object:  Default [DF_tblContestMaster_ctstType]    Script Date: 04/20/2018 17:36:34 ******/
ALTER TABLE [dbo].[tblContestMaster] ADD  CONSTRAINT [DF_tblContestMaster_ctstType]  DEFAULT ('TRAVEL,CASH,POINTS') FOR [ctstType]
GO
/****** Object:  Default [DF_tblContestMaster_CMCounter]    Script Date: 04/20/2018 17:36:34 ******/
ALTER TABLE [dbo].[tblContestMaster] ADD  CONSTRAINT [DF_tblContestMaster_CMCounter]  DEFAULT (NULL) FOR [CMCounter]
GO
/****** Object:  Default [DF_tblTransactionCash_Status]    Script Date: 04/20/2018 17:36:34 ******/
ALTER TABLE [dbo].[tblTransactionCash] ADD  CONSTRAINT [DF_tblTransactionCash_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_tblTransactionTickets_Status]    Script Date: 04/20/2018 17:36:34 ******/
ALTER TABLE [dbo].[tblTransactionTickets] ADD  CONSTRAINT [DF_tblTransactionTickets_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  ForeignKey [FK_tblCAmap_AgntTypeId_PK_tblAgentTypeMaster_AgntTypeId]    Script Date: 04/20/2018 17:36:34 ******/
ALTER TABLE [dbo].[tblCAmap]  WITH CHECK ADD  CONSTRAINT [FK_tblCAmap_AgntTypeId_PK_tblAgentTypeMaster_AgntTypeId] FOREIGN KEY([AgntTypeId])
REFERENCES [dbo].[tblAgentTypeMaster] ([AgntTypeId])
GO
ALTER TABLE [dbo].[tblCAmap] CHECK CONSTRAINT [FK_tblCAmap_AgntTypeId_PK_tblAgentTypeMaster_AgntTypeId]
GO
/****** Object:  ForeignKey [FK_tblCAmap_Cid_PK_tblChannelMaster_Cid]    Script Date: 04/20/2018 17:36:34 ******/
ALTER TABLE [dbo].[tblCAmap]  WITH CHECK ADD  CONSTRAINT [FK_tblCAmap_Cid_PK_tblChannelMaster_Cid] FOREIGN KEY([Cid])
REFERENCES [dbo].[tblChannelMaster] ([Cid])
GO
ALTER TABLE [dbo].[tblCAmap] CHECK CONSTRAINT [FK_tblCAmap_Cid_PK_tblChannelMaster_Cid]
GO
