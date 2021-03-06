
USE AppWflow

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 11/12/2019 12:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[UserHeadId] [int] NOT NULL,
	[WorkFlowId] [int] NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlowRequestActions]    Script Date: 11/12/2019 12:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlowRequestActions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[FlowRequestId] [int] NOT NULL,
	[ActionDate] [datetime2](7) NOT NULL,
	[RequestStatus] [nvarchar](10) NOT NULL,
	[RedirectToDepartmentId] [int] NULL,
 CONSTRAINT [PK_FlowRequestActions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlowRequests]    Script Date: 11/12/2019 12:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlowRequests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[WorkFlowId] [int] NOT NULL,
	[RequestDate] [datetime2](7) NOT NULL,
	[FinishedDate] [datetime2](7) NULL,
	[IsClosed] [bit] NOT NULL,
	[IsNewRequest] [bit] NOT NULL,
	[CurrentFlowRequestActionId] [int] NULL,
 CONSTRAINT [PK_FlowRequests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/12/2019 12:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DepartmentId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkFlows]    Script Date: 11/12/2019 12:52:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkFlows](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Details] [nvarchar](100) NULL,
	[DepartmentId] [int] NOT NULL,
	[FlowRequestId] [int] NULL,
 CONSTRAINT [PK_WorkFlows] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Departments_UserHeadId]    Script Date: 11/12/2019 12:52:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_Departments_UserHeadId] ON [dbo].[Departments]
(
	[UserHeadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Departments_WorkFlowId]    Script Date: 11/12/2019 12:52:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_Departments_WorkFlowId] ON [dbo].[Departments]
(
	[WorkFlowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FlowRequestActions_FlowRequestId]    Script Date: 11/12/2019 12:52:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_FlowRequestActions_FlowRequestId] ON [dbo].[FlowRequestActions]
(
	[FlowRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FlowRequestActions_RedirectToDepartmentId]    Script Date: 11/12/2019 12:52:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_FlowRequestActions_RedirectToDepartmentId] ON [dbo].[FlowRequestActions]
(
	[RedirectToDepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FlowRequests_WorkFlowId]    Script Date: 11/12/2019 12:52:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_FlowRequests_WorkFlowId] ON [dbo].[FlowRequests]
(
	[WorkFlowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_DepartmentId]    Script Date: 11/12/2019 12:52:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_DepartmentId] ON [dbo].[Users]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_WorkFlows_DepartmentId]    Script Date: 11/12/2019 12:52:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_WorkFlows_DepartmentId] ON [dbo].[WorkFlows]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_WorkFlows_FlowRequestId]    Script Date: 11/12/2019 12:52:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_WorkFlows_FlowRequestId] ON [dbo].[WorkFlows]
(
	[FlowRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FlowRequests] ADD  CONSTRAINT [DF_FlowRequests_RequestDate]  DEFAULT (getdate()) FOR [RequestDate]
GO
ALTER TABLE [dbo].[FlowRequests] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsClosed]
GO
ALTER TABLE [dbo].[FlowRequests] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsNewRequest]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_Users_UserHeadId] FOREIGN KEY([UserHeadId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_Users_UserHeadId]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_WorkFlows_WorkFlowId] FOREIGN KEY([WorkFlowId])
REFERENCES [dbo].[WorkFlows] ([Id])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_WorkFlows_WorkFlowId]
GO
ALTER TABLE [dbo].[FlowRequestActions]  WITH CHECK ADD  CONSTRAINT [FK_FlowRequestActions_Departments_RedirectToDepartmentId] FOREIGN KEY([RedirectToDepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[FlowRequestActions] CHECK CONSTRAINT [FK_FlowRequestActions_Departments_RedirectToDepartmentId]
GO
ALTER TABLE [dbo].[FlowRequestActions]  WITH CHECK ADD  CONSTRAINT [FK_FlowRequestActions_FlowRequests_FlowRequestId] FOREIGN KEY([FlowRequestId])
REFERENCES [dbo].[FlowRequests] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FlowRequestActions] CHECK CONSTRAINT [FK_FlowRequestActions_FlowRequests_FlowRequestId]
GO
ALTER TABLE [dbo].[FlowRequests]  WITH CHECK ADD  CONSTRAINT [FK_FlowRequests_WorkFlows_WorkFlowId] FOREIGN KEY([WorkFlowId])
REFERENCES [dbo].[WorkFlows] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FlowRequests] CHECK CONSTRAINT [FK_FlowRequests_WorkFlows_WorkFlowId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Departments_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Departments_DepartmentId]
GO
ALTER TABLE [dbo].[WorkFlows]  WITH CHECK ADD  CONSTRAINT [FK_WorkFlows_Departments_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkFlows] CHECK CONSTRAINT [FK_WorkFlows_Departments_DepartmentId]
GO
ALTER TABLE [dbo].[WorkFlows]  WITH CHECK ADD  CONSTRAINT [FK_WorkFlows_FlowRequests_FlowRequestId] FOREIGN KEY([FlowRequestId])
REFERENCES [dbo].[FlowRequests] ([Id])
GO
ALTER TABLE [dbo].[WorkFlows] CHECK CONSTRAINT [FK_WorkFlows_FlowRequests_FlowRequestId]
GO
