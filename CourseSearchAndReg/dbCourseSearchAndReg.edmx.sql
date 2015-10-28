
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/28/2015 17:06:50
-- Generated from EDMX file: C:\Users\joshua\OneDrive\OIT_SkillsAssessment\CourseSearchAndReg\CourseSearchAndReg\dbCourseSearchAndReg.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [edinborough];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Students'
CREATE TABLE [dbo].[Students] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Buildings'
CREATE TABLE [dbo].[Buildings] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nchar(50)  NOT NULL
);
GO

-- Creating table 'Classrooms'
CREATE TABLE [dbo].[Classrooms] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [BuildingId] int  NOT NULL,
    [Room] nchar(10)  NOT NULL,
    [Building_Id] int  NOT NULL
);
GO

-- Creating table 'Instructors'
CREATE TABLE [dbo].[Instructors] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Section_Id] int  NOT NULL
);
GO

-- Creating table 'Courses'
CREATE TABLE [dbo].[Courses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DesignatorId] nvarchar(max)  NOT NULL,
    [Title] nvarchar(70)  NOT NULL,
    [Number] nvarchar(10)  NOT NULL,
    [Designator_Id] int  NOT NULL
);
GO

-- Creating table 'Sections'
CREATE TABLE [dbo].[Sections] (
    [Id] int  NOT NULL,
    [CourseId] int  NOT NULL,
    [Capacity] int  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NOT NULL,
    [InstructorId] int  NULL,
    [Courses_Id] int  NOT NULL,
    [Registration_Id] int  NOT NULL
);
GO

-- Creating table 'MeetingTimes'
CREATE TABLE [dbo].[MeetingTimes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SectionId] int  NOT NULL,
    [Day] tinyint  NOT NULL,
    [StartTime] time  NOT NULL,
    [EndTime] time  NOT NULL,
    [ClassroomId] int  NULL,
    [Section_Id] int  NOT NULL,
    [Classroom_Id] int  NOT NULL
);
GO

-- Creating table 'Registrations'
CREATE TABLE [dbo].[Registrations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StudentId] int  NOT NULL,
    [SectionId] int  NOT NULL,
    [Student_Id] int  NOT NULL
);
GO

-- Creating table 'Designators'
CREATE TABLE [dbo].[Designators] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Designator] nchar(3)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [PK_Students]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Buildings'
ALTER TABLE [dbo].[Buildings]
ADD CONSTRAINT [PK_Buildings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Classrooms'
ALTER TABLE [dbo].[Classrooms]
ADD CONSTRAINT [PK_Classrooms]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Instructors'
ALTER TABLE [dbo].[Instructors]
ADD CONSTRAINT [PK_Instructors]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [PK_Courses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Sections'
ALTER TABLE [dbo].[Sections]
ADD CONSTRAINT [PK_Sections]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MeetingTimes'
ALTER TABLE [dbo].[MeetingTimes]
ADD CONSTRAINT [PK_MeetingTimes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Registrations'
ALTER TABLE [dbo].[Registrations]
ADD CONSTRAINT [PK_Registrations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Designators'
ALTER TABLE [dbo].[Designators]
ADD CONSTRAINT [PK_Designators]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Building_Id] in table 'Classrooms'
ALTER TABLE [dbo].[Classrooms]
ADD CONSTRAINT [FK_BuildingClassroom]
    FOREIGN KEY ([Building_Id])
    REFERENCES [dbo].[Buildings]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BuildingClassroom'
CREATE INDEX [IX_FK_BuildingClassroom]
ON [dbo].[Classrooms]
    ([Building_Id]);
GO

-- Creating foreign key on [Section_Id] in table 'MeetingTimes'
ALTER TABLE [dbo].[MeetingTimes]
ADD CONSTRAINT [FK_SectionMeetingTimes]
    FOREIGN KEY ([Section_Id])
    REFERENCES [dbo].[Sections]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SectionMeetingTimes'
CREATE INDEX [IX_FK_SectionMeetingTimes]
ON [dbo].[MeetingTimes]
    ([Section_Id]);
GO

-- Creating foreign key on [Courses_Id] in table 'Sections'
ALTER TABLE [dbo].[Sections]
ADD CONSTRAINT [FK_SectionCourse]
    FOREIGN KEY ([Courses_Id])
    REFERENCES [dbo].[Courses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SectionCourse'
CREATE INDEX [IX_FK_SectionCourse]
ON [dbo].[Sections]
    ([Courses_Id]);
GO

-- Creating foreign key on [Classroom_Id] in table 'MeetingTimes'
ALTER TABLE [dbo].[MeetingTimes]
ADD CONSTRAINT [FK_ClassroomMeetingTimes]
    FOREIGN KEY ([Classroom_Id])
    REFERENCES [dbo].[Classrooms]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClassroomMeetingTimes'
CREATE INDEX [IX_FK_ClassroomMeetingTimes]
ON [dbo].[MeetingTimes]
    ([Classroom_Id]);
GO

-- Creating foreign key on [Section_Id] in table 'Instructors'
ALTER TABLE [dbo].[Instructors]
ADD CONSTRAINT [FK_SectionInstructor]
    FOREIGN KEY ([Section_Id])
    REFERENCES [dbo].[Sections]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SectionInstructor'
CREATE INDEX [IX_FK_SectionInstructor]
ON [dbo].[Instructors]
    ([Section_Id]);
GO

-- Creating foreign key on [Student_Id] in table 'Registrations'
ALTER TABLE [dbo].[Registrations]
ADD CONSTRAINT [FK_StudentRegistration]
    FOREIGN KEY ([Student_Id])
    REFERENCES [dbo].[Students]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentRegistration'
CREATE INDEX [IX_FK_StudentRegistration]
ON [dbo].[Registrations]
    ([Student_Id]);
GO

-- Creating foreign key on [Registration_Id] in table 'Sections'
ALTER TABLE [dbo].[Sections]
ADD CONSTRAINT [FK_RegistrationSection]
    FOREIGN KEY ([Registration_Id])
    REFERENCES [dbo].[Registrations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RegistrationSection'
CREATE INDEX [IX_FK_RegistrationSection]
ON [dbo].[Sections]
    ([Registration_Id]);
GO

-- Creating foreign key on [Designator_Id] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [FK_CourseDesignators]
    FOREIGN KEY ([Designator_Id])
    REFERENCES [dbo].[Designators]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CourseDesignators'
CREATE INDEX [IX_FK_CourseDesignators]
ON [dbo].[Courses]
    ([Designator_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------