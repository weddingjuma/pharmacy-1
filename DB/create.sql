USE [pharmabase]
GO
/****** Object:  ForeignKey [FK_AntibioticAntibioticIndication_AntibioticTracking]    Script Date: 01/01/2015 22:24:24 ******/
ALTER TABLE [dbo].[AntibioticAntibioticIndication] DROP CONSTRAINT [FK_AntibioticAntibioticIndication_AntibioticTracking]
GO
/****** Object:  ForeignKey [FK_AntibioticAntibioticPrescribed_AntibioticTracking]    Script Date: 01/01/2015 22:24:24 ******/
ALTER TABLE [dbo].[AntibioticAntibioticPrescribed] DROP CONSTRAINT [FK_AntibioticAntibioticPrescribed_AntibioticTracking]
GO
/****** Object:  ForeignKey [FK_AntibioticLabs_AntibioticTracking]    Script Date: 01/01/2015 22:24:24 ******/
ALTER TABLE [dbo].[AntibioticLabs] DROP CONSTRAINT [FK_AntibioticLabs_AntibioticTracking]
GO
/****** Object:  ForeignKey [FK_AntibioticsCostSavingsDaysTherapy_Sites]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[AntibioticsCostSavingsDaysTherapy] DROP CONSTRAINT [FK_AntibioticsCostSavingsDaysTherapy_Sites]
GO
/****** Object:  ForeignKey [FK_AntibioticsCostSavingsTracking_AntibioticTracking1]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[AntibioticsCostSavingsTracking] DROP CONSTRAINT [FK_AntibioticsCostSavingsTracking_AntibioticTracking1]
GO
/****** Object:  ForeignKey [FK_AntibioticStewardshipChecklist_AntibioticTracking]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[AntibioticStewardshipChecklist] DROP CONSTRAINT [FK_AntibioticStewardshipChecklist_AntibioticTracking]
GO
/****** Object:  ForeignKey [FK_AntibioticTracking_Patients]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[AntibioticTracking] DROP CONSTRAINT [FK_AntibioticTracking_Patients]
GO
/****** Object:  ForeignKey [FK_CompoundedDrugsDetails_CompoundedDrugs]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[CompoundedDrugsDetails] DROP CONSTRAINT [FK_CompoundedDrugsDetails_CompoundedDrugs]
GO
/****** Object:  ForeignKey [FK_Interventions_Patients]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[Interventions] DROP CONSTRAINT [FK_Interventions_Patients]
GO
/****** Object:  ForeignKey [FK_InterventionsIntervention_Interventions]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[InterventionsIntervention] DROP CONSTRAINT [FK_InterventionsIntervention_Interventions]
GO
/****** Object:  ForeignKey [FK_InterventionTypes_Sites]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[InterventionTypes] DROP CONSTRAINT [FK_InterventionTypes_Sites]
GO
/****** Object:  ForeignKey [FK_PatientAllergies_Patients]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[PatientAllergies] DROP CONSTRAINT [FK_PatientAllergies_Patients]
GO
/****** Object:  ForeignKey [FK_Patients_Patients]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[Patients] DROP CONSTRAINT [FK_Patients_Patients]
GO
/****** Object:  ForeignKey [FK_TaskLogDetails_TaskLog]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[TaskLogDetails] DROP CONSTRAINT [FK_TaskLogDetails_TaskLog]
GO
/****** Object:  ForeignKey [FK_TaskLogsTracking_Sites]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[TaskLogsTracking] DROP CONSTRAINT [FK_TaskLogsTracking_Sites]
GO
/****** Object:  ForeignKey [FK_TaskLogsTrackingEmail_TaskLogsTracking]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[TaskLogsTrackingEmail] DROP CONSTRAINT [FK_TaskLogsTrackingEmail_TaskLogsTracking]
GO
/****** Object:  ForeignKey [FK_WarfarinIndication_WarfarinTracking]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[WarfarinIndication] DROP CONSTRAINT [FK_WarfarinIndication_WarfarinTracking]
GO
/****** Object:  ForeignKey [FK_WarfarinLabs_WarfarinTracking]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[WarfarinLabs] DROP CONSTRAINT [FK_WarfarinLabs_WarfarinTracking]
GO
/****** Object:  ForeignKey [FK_WarfarinTracking_Patients]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[WarfarinTracking] DROP CONSTRAINT [FK_WarfarinTracking_Patients]
GO
/****** Object:  ForeignKey [FK_WarfarinWarfarinInrGoal_WarfarinIndication]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[WarfarinWarfarinInrGoal] DROP CONSTRAINT [FK_WarfarinWarfarinInrGoal_WarfarinIndication]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateWarfarinWarfarinInrGoal]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[AddUpdateWarfarinWarfarinInrGoal]
GO
/****** Object:  StoredProcedure [dbo].[DeleteWarfarinWarfarinInrGoal]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteWarfarinWarfarinInrGoal]
GO
/****** Object:  StoredProcedure [dbo].[GetWarfarinWarfarinInrGoalByWarfarinIndicationID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetWarfarinWarfarinInrGoalByWarfarinIndicationID]
GO
/****** Object:  StoredProcedure [dbo].[GetWarfarinWarfarinInrGoalPerSiteByDate]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetWarfarinWarfarinInrGoalPerSiteByDate]
GO
/****** Object:  StoredProcedure [dbo].[GetTaskLogsTrackingById]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetTaskLogsTrackingById]
GO
/****** Object:  StoredProcedure [dbo].[GetWarfarinLabsByWarfarinTrackingID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetWarfarinLabsByWarfarinTrackingID]
GO
/****** Object:  StoredProcedure [dbo].[GetWarfarinLabsInrPerSiteByDate]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetWarfarinLabsInrPerSiteByDate]
GO
/****** Object:  StoredProcedure [dbo].[GetInterventionsInterventionsByInterventionsID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetInterventionsInterventionsByInterventionsID]
GO
/****** Object:  StoredProcedure [dbo].[GetRecentAntibioticLabsByAntibioticTrackingID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetRecentAntibioticLabsByAntibioticTrackingID]
GO
/****** Object:  StoredProcedure [dbo].[GetRecentWarfarinLabsByWarfarinTrackingID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetRecentWarfarinLabsByWarfarinTrackingID]
GO
/****** Object:  StoredProcedure [dbo].[GetTaskEmailList]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetTaskEmailList]
GO
/****** Object:  StoredProcedure [dbo].[DeleteWarfarinLab]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteWarfarinLab]
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticAntibioticIndicationByAntibioticTrackingID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAntibioticAntibioticIndicationByAntibioticTrackingID]
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticAntibioticPrescribedByAntibioticTrackingID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAntibioticAntibioticPrescribedByAntibioticTrackingID]
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticIndicationPerSiteByDate]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAntibioticIndicationPerSiteByDate]
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticLabsByAntibioticTrackingID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAntibioticLabsByAntibioticTrackingID]
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticPrescribedPerSiteByDate]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAntibioticPrescribedPerSiteByDate]
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticsCostSavingsTrackingAcceptedPerSiteByDate]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAntibioticsCostSavingsTrackingAcceptedPerSiteByDate]
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticsCostSavingsTrackingByAntibioticTrackingID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAntibioticsCostSavingsTrackingByAntibioticTrackingID]
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticsCostSavingsTrackingByID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAntibioticsCostSavingsTrackingByID]
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticsCostSavingsTrackingRecommendedPerSiteByDate]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAntibioticsCostSavingsTrackingRecommendedPerSiteByDate]
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticStewardshipChecklist]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAntibioticStewardshipChecklist]
GO
/****** Object:  StoredProcedure [dbo].[DeleteTaskLogsTrackingEmail]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteTaskLogsTrackingEmail]
GO
/****** Object:  StoredProcedure [dbo].[AddInterventionsIntervention]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddInterventionsIntervention]
GO
/****** Object:  StoredProcedure [dbo].[AddTaskLogsTrackingEmail]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddTaskLogsTrackingEmail]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAntibioticAntibioticIndication]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateAntibioticAntibioticIndication]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAntibioticAntibioticPrescribed]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateAntibioticAntibioticPrescribed]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAntibioticLab]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateAntibioticLab]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAntibioticsCostSavingsTracking]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateAntibioticsCostSavingsTracking]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAntibioticStewardshipChecklist]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateAntibioticStewardshipChecklist]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateWarfarinIndication]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[AddUpdateWarfarinIndication]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateWarfarinLab]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[AddUpdateWarfarinLab]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAntibioticLab]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteAntibioticLab]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAntibioticsCostSavingsTrackingByID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteAntibioticsCostSavingsTrackingByID]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAntibioticAntibioticIndication]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteAntibioticAntibioticIndication]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAntibioticAntibioticPrescribed]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteAntibioticAntibioticPrescribed]
GO
/****** Object:  StoredProcedure [dbo].[DeleteInterventionsIntervention]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteInterventionsIntervention]
GO
/****** Object:  StoredProcedure [dbo].[UpdateAntibioticsCostSavingsTrackingRecommendedAcceptedByID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[UpdateAntibioticsCostSavingsTrackingRecommendedAcceptedByID]
GO
/****** Object:  Table [dbo].[WarfarinWarfarinInrGoal]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[WarfarinWarfarinInrGoal] DROP CONSTRAINT [FK_WarfarinWarfarinInrGoal_WarfarinIndication]
GO
DROP TABLE [dbo].[WarfarinWarfarinInrGoal]
GO
/****** Object:  StoredProcedure [dbo].[GetWarfarinIndicationByWarfarinTrackingID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetWarfarinIndicationByWarfarinTrackingID]
GO
/****** Object:  StoredProcedure [dbo].[GetWarfarinIndicationPerSiteByDate]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetWarfarinIndicationPerSiteByDate]
GO
/****** Object:  Table [dbo].[WarfarinIndication]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[WarfarinIndication] DROP CONSTRAINT [FK_WarfarinIndication_WarfarinTracking]
GO
DROP TABLE [dbo].[WarfarinIndication]
GO
/****** Object:  Table [dbo].[WarfarinLabs]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[WarfarinLabs] DROP CONSTRAINT [FK_WarfarinLabs_WarfarinTracking]
GO
ALTER TABLE [dbo].[WarfarinLabs] DROP CONSTRAINT [DF_WarfarinLabs]
GO
DROP TABLE [dbo].[WarfarinLabs]
GO
/****** Object:  StoredProcedure [dbo].[TempGetAppID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[TempGetAppID]
GO
/****** Object:  Table [dbo].[TaskLogsTrackingEmail]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[TaskLogsTrackingEmail] DROP CONSTRAINT [FK_TaskLogsTrackingEmail_TaskLogsTracking]
GO
DROP TABLE [dbo].[TaskLogsTrackingEmail]
GO
/****** Object:  StoredProcedure [dbo].[SendTaskLogTrackingEmail]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[SendTaskLogTrackingEmail]
GO
/****** Object:  StoredProcedure [dbo].[DeleteInterventionTypes]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteInterventionTypes]
GO
/****** Object:  StoredProcedure [dbo].[DeletePatientAllergies]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeletePatientAllergies]
GO
/****** Object:  StoredProcedure [dbo].[DeleteTaskLogDetail]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteTaskLogDetail]
GO
/****** Object:  StoredProcedure [dbo].[DeleteInterventions]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteInterventions]
GO
/****** Object:  StoredProcedure [dbo].[DeleteTaskLogsTracking]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteTaskLogsTracking]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCompoundedDrugsDetails]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteCompoundedDrugsDetails]
GO
/****** Object:  StoredProcedure [dbo].[CheckInterventionTypesByName]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[CheckInterventionTypesByName]
GO
/****** Object:  Table [dbo].[AntibioticLabs]    Script Date: 01/01/2015 22:24:24 ******/
ALTER TABLE [dbo].[AntibioticLabs] DROP CONSTRAINT [FK_AntibioticLabs_AntibioticTracking]
GO
ALTER TABLE [dbo].[AntibioticLabs] DROP CONSTRAINT [DF_AntibioticLabs]
GO
DROP TABLE [dbo].[AntibioticLabs]
GO
/****** Object:  Table [dbo].[AntibioticStewardshipChecklist]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[AntibioticStewardshipChecklist] DROP CONSTRAINT [FK_AntibioticStewardshipChecklist_AntibioticTracking]
GO
DROP TABLE [dbo].[AntibioticStewardshipChecklist]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateWarfarinTracking]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[AddUpdateWarfarinTracking]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateTaskLogDetails]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateTaskLogDetails]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateTaskLogsTracking]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateTaskLogsTracking]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateCompoundedDrugsDetails]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateCompoundedDrugsDetails]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateInterventions]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateInterventions]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateInterventionTypes]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateInterventionTypes]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAntibioticTracking]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateAntibioticTracking]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAntibioticsCostSavingsDaysTherapy]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateAntibioticsCostSavingsDaysTherapy]
GO
/****** Object:  StoredProcedure [dbo].[AddPatientAllergies]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddPatientAllergies]
GO
/****** Object:  Table [dbo].[AntibioticAntibioticIndication]    Script Date: 01/01/2015 22:24:24 ******/
ALTER TABLE [dbo].[AntibioticAntibioticIndication] DROP CONSTRAINT [FK_AntibioticAntibioticIndication_AntibioticTracking]
GO
DROP TABLE [dbo].[AntibioticAntibioticIndication]
GO
/****** Object:  Table [dbo].[AntibioticAntibioticPrescribed]    Script Date: 01/01/2015 22:24:24 ******/
ALTER TABLE [dbo].[AntibioticAntibioticPrescribed] DROP CONSTRAINT [FK_AntibioticAntibioticPrescribed_AntibioticTracking]
GO
DROP TABLE [dbo].[AntibioticAntibioticPrescribed]
GO
/****** Object:  Table [dbo].[AntibioticsCostSavingsTracking]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[AntibioticsCostSavingsTracking] DROP CONSTRAINT [FK_AntibioticsCostSavingsTracking_AntibioticTracking1]
GO
DROP TABLE [dbo].[AntibioticsCostSavingsTracking]
GO
/****** Object:  StoredProcedure [dbo].[GetInterventionsByPatientID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetInterventionsByPatientID]
GO
/****** Object:  StoredProcedure [dbo].[GetInterventionsByPatientName]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetInterventionsByPatientName]
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticTrackingByPatientID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAntibioticTrackingByPatientID]
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticTrackingByPatientName]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAntibioticTrackingByPatientName]
GO
/****** Object:  StoredProcedure [dbo].[GetPatient]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetPatient]
GO
/****** Object:  StoredProcedure [dbo].[GetCompoundedDrugDetails]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetCompoundedDrugDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetCompoundedDrugDetailsByID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetCompoundedDrugDetailsByID]
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticsCostSavingsDaysTherapy]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAntibioticsCostSavingsDaysTherapy]
GO
/****** Object:  StoredProcedure [dbo].[GetTaskLogsTracking]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetTaskLogsTracking]
GO
/****** Object:  StoredProcedure [dbo].[GetTaskLogDetails]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetTaskLogDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetTaskLogDetailsByID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetTaskLogDetailsByID]
GO
/****** Object:  StoredProcedure [dbo].[GetTaskLogDetailsByIDByDate]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetTaskLogDetailsByIDByDate]
GO
/****** Object:  StoredProcedure [dbo].[GetTaskLogDetailsPerSiteByDate]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetTaskLogDetailsPerSiteByDate]
GO
/****** Object:  StoredProcedure [dbo].[GetInterventionsPerSiteByDate]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetInterventionsPerSiteByDate]
GO
/****** Object:  StoredProcedure [dbo].[GetInterventionTypes]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetInterventionTypes]
GO
/****** Object:  StoredProcedure [dbo].[GetInterventionTypesByName]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetInterventionTypesByName]
GO
/****** Object:  StoredProcedure [dbo].[GetInterventionTypesBySite]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetInterventionTypesBySite]
GO
/****** Object:  StoredProcedure [dbo].[GetWarfarinTrackingByPatientID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetWarfarinTrackingByPatientID]
GO
/****** Object:  StoredProcedure [dbo].[GetWarfarinTrackingByPatientName]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetWarfarinTrackingByPatientName]
GO
/****** Object:  StoredProcedure [dbo].[GetWarfarinTrackingPerSiteByDate]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetWarfarinTrackingPerSiteByDate]
GO
/****** Object:  Table [dbo].[InterventionsIntervention]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[InterventionsIntervention] DROP CONSTRAINT [FK_InterventionsIntervention_Interventions]
GO
DROP TABLE [dbo].[InterventionsIntervention]
GO
/****** Object:  Table [dbo].[InterventionTypes]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[InterventionTypes] DROP CONSTRAINT [FK_InterventionTypes_Sites]
GO
DROP TABLE [dbo].[InterventionTypes]
GO
/****** Object:  Table [dbo].[PatientAllergies]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[PatientAllergies] DROP CONSTRAINT [FK_PatientAllergies_Patients]
GO
DROP TABLE [dbo].[PatientAllergies]
GO
/****** Object:  StoredProcedure [dbo].[GetTasks]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetTasks]
GO
/****** Object:  StoredProcedure [dbo].[GetTasksByName]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetTasksByName]
GO
/****** Object:  StoredProcedure [dbo].[GetTemperatures]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetTemperatures]
GO
/****** Object:  StoredProcedure [dbo].[GetUserLogBySite]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetUserLogBySite]
GO
/****** Object:  StoredProcedure [dbo].[GetUserRoles]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetUserRoles]
GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetUsers]
GO
/****** Object:  Table [dbo].[Interventions]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[Interventions] DROP CONSTRAINT [FK_Interventions_Patients]
GO
ALTER TABLE [dbo].[Interventions] DROP CONSTRAINT [DF_Interventions_EnteredDateTime]
GO
DROP TABLE [dbo].[Interventions]
GO
/****** Object:  StoredProcedure [dbo].[GetSites]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetSites]
GO
/****** Object:  StoredProcedure [dbo].[GetSitesUsers]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetSitesUsers]
GO
/****** Object:  StoredProcedure [dbo].[GetTaskLogStatus]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetTaskLogStatus]
GO
/****** Object:  StoredProcedure [dbo].[GetTaskLog]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetTaskLog]
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticsCostSavingsDaysTherapyByDescriptionType]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAntibioticsCostSavingsDaysTherapyByDescriptionType]
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticsCostSavingsTrackingLookup]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAntibioticsCostSavingsTrackingLookup]
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticsCostSavingsTrackingLookupById]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAntibioticsCostSavingsTrackingLookupById]
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticsCostSavingsTrackingLookupByType]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAntibioticsCostSavingsTrackingLookupByType]
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticIndications]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAntibioticIndications]
GO
/****** Object:  StoredProcedure [dbo].[GetActions]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetActions]
GO
/****** Object:  StoredProcedure [dbo].[GetActionsByName]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetActionsByName]
GO
/****** Object:  StoredProcedure [dbo].[GetAllergies]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAllergies]
GO
/****** Object:  StoredProcedure [dbo].[GetAllergiesByID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAllergiesByID]
GO
/****** Object:  StoredProcedure [dbo].[GetAllergiesByName]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetAllergiesByName]
GO
/****** Object:  StoredProcedure [dbo].[GetCompoundedDrugs]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetCompoundedDrugs]
GO
/****** Object:  StoredProcedure [dbo].[GetCompoundedDrugsByID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetCompoundedDrugsByID]
GO
/****** Object:  StoredProcedure [dbo].[GetCompoundedLookup]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetCompoundedLookup]
GO
/****** Object:  StoredProcedure [dbo].[GetCompoundedLookupByID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetCompoundedLookupByID]
GO
/****** Object:  StoredProcedure [dbo].[GetContentByPage]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetContentByPage]
GO
/****** Object:  StoredProcedure [dbo].[GetCorrectiveAction]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetCorrectiveAction]
GO
/****** Object:  StoredProcedure [dbo].[GetCorrectiveActionsByName]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetCorrectiveActionsByName]
GO
/****** Object:  StoredProcedure [dbo].[GetDose]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetDose]
GO
/****** Object:  StoredProcedure [dbo].[GetDrugs]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetDrugs]
GO
/****** Object:  StoredProcedure [dbo].[GetEquipment]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetEquipment]
GO
/****** Object:  StoredProcedure [dbo].[GetEquipmentByName]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetEquipmentByName]
GO
/****** Object:  StoredProcedure [dbo].[Getfrequencies]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[Getfrequencies]
GO
/****** Object:  StoredProcedure [dbo].[GetHashCode]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetHashCode]
GO
/****** Object:  StoredProcedure [dbo].[GetPatientByIN]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetPatientByIN]
GO
/****** Object:  StoredProcedure [dbo].[GetPatients]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetPatients]
GO
/****** Object:  StoredProcedure [dbo].[GetPatientsAntibioticTracking]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetPatientsAntibioticTracking]
GO
/****** Object:  StoredProcedure [dbo].[GetPatientsInerventions]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetPatientsInerventions]
GO
/****** Object:  StoredProcedure [dbo].[GetPatientsWarfarinTracking]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetPatientsWarfarinTracking]
GO
/****** Object:  StoredProcedure [dbo].[GetPhysicians]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetPhysicians]
GO
/****** Object:  StoredProcedure [dbo].[GetPhysiciansBySiteID]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetPhysiciansBySiteID]
GO
/****** Object:  StoredProcedure [dbo].[GetCompanyInfo]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetCompanyInfo]
GO
/****** Object:  StoredProcedure [dbo].[DeleteTemperature]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteTemperature]
GO
/****** Object:  StoredProcedure [dbo].[DeleteWarfarinInr]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteWarfarinInr]
GO
/****** Object:  StoredProcedure [dbo].[AddUserLog]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[AddUserLog]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAction]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateAction]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAllergy]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateAllergy]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAntibioticsCostSavingsLookup]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateAntibioticsCostSavingsLookup]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAntibioticIndications]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateAntibioticIndications]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateCompoundedDrugs]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateCompoundedDrugs]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdatePatient]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdatePatient]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdatePhysician]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdatePhysician]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateSite]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateSite]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateTask]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateTask]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateTaskLog]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateTaskLog]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateCompoundedLookup]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateCompoundedLookup]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateCorrectiveAction]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateCorrectiveAction]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateDose]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateDose]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateDrugs]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateDrugs]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateEquipment]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateEquipment]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateFrequency]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateFrequency]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateTemperature]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[AddUpdateTemperature]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateUser]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[AddUpdateUser]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateTaskLogStatus]    Script Date: 01/01/2015 22:24:28 ******/
DROP PROCEDURE [dbo].[AddUpdateTaskLogStatus]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateWarfarinInr]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[AddUpdateWarfarinInr]
GO
/****** Object:  Table [dbo].[AntibioticTracking]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[AntibioticTracking] DROP CONSTRAINT [FK_AntibioticTracking_Patients]
GO
ALTER TABLE [dbo].[AntibioticTracking] DROP CONSTRAINT [DF_AntibioticTracking_EnteredDateTime]
GO
DROP TABLE [dbo].[AntibioticTracking]
GO
/****** Object:  Table [dbo].[AntibioticsCostSavingsDaysTherapy]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[AntibioticsCostSavingsDaysTherapy] DROP CONSTRAINT [FK_AntibioticsCostSavingsDaysTherapy_Sites]
GO
DROP TABLE [dbo].[AntibioticsCostSavingsDaysTherapy]
GO
/****** Object:  Table [dbo].[CompoundedDrugsDetails]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[CompoundedDrugsDetails] DROP CONSTRAINT [FK_CompoundedDrugsDetails_CompoundedDrugs]
GO
DROP TABLE [dbo].[CompoundedDrugsDetails]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCompoundedLookup]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteCompoundedLookup]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCorrectiveActions]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteCorrectiveActions]
GO
/****** Object:  StoredProcedure [dbo].[DeleteDoses]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteDoses]
GO
/****** Object:  StoredProcedure [dbo].[DeleteDrugs]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteDrugs]
GO
/****** Object:  StoredProcedure [dbo].[DeleteEquipment]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteEquipment]
GO
/****** Object:  StoredProcedure [dbo].[DeleteExpiredSessions]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteExpiredSessions]
GO
/****** Object:  StoredProcedure [dbo].[DeleteFrequency]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteFrequency]
GO
/****** Object:  StoredProcedure [dbo].[DeleteTaskLogStatus]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteTaskLogStatus]
GO
/****** Object:  StoredProcedure [dbo].[DeletePhysician]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeletePhysician]
GO
/****** Object:  StoredProcedure [dbo].[DeleteTask]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteTask]
GO
/****** Object:  StoredProcedure [dbo].[DeleteTaskLog]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteTaskLog]
GO
/****** Object:  StoredProcedure [dbo].[DeleteLookup]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteLookup]
GO
/****** Object:  StoredProcedure [dbo].[DeletePatient]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeletePatient]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAntibioticIndications]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteAntibioticIndications]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAction]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteAction]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAllergy]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[DeleteAllergy]
GO
/****** Object:  View [dbo].[PatientsView]    Script Date: 01/01/2015 22:24:27 ******/
DROP VIEW [dbo].[PatientsView]
GO
/****** Object:  StoredProcedure [dbo].[TempInsertStateItemLong]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[TempInsertStateItemLong]
GO
/****** Object:  StoredProcedure [dbo].[TempInsertStateItemShort]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[TempInsertStateItemShort]
GO
/****** Object:  StoredProcedure [dbo].[TempInsertUninitializedItem]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[TempInsertUninitializedItem]
GO
/****** Object:  StoredProcedure [dbo].[TempReleaseStateItemExclusive]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[TempReleaseStateItemExclusive]
GO
/****** Object:  StoredProcedure [dbo].[TempRemoveStateItem]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[TempRemoveStateItem]
GO
/****** Object:  StoredProcedure [dbo].[TempResetTimeout]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[TempResetTimeout]
GO
/****** Object:  StoredProcedure [dbo].[TempUpdateStateItemLong]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[TempUpdateStateItemLong]
GO
/****** Object:  StoredProcedure [dbo].[TempUpdateStateItemLongNullShort]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[TempUpdateStateItemLongNullShort]
GO
/****** Object:  StoredProcedure [dbo].[TempUpdateStateItemShort]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[TempUpdateStateItemShort]
GO
/****** Object:  StoredProcedure [dbo].[TempUpdateStateItemShortNullLong]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[TempUpdateStateItemShortNullLong]
GO
/****** Object:  Table [dbo].[TaskLogDetails]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[TaskLogDetails] DROP CONSTRAINT [FK_TaskLogDetails_TaskLog]
GO
DROP TABLE [dbo].[TaskLogDetails]
GO
/****** Object:  StoredProcedure [dbo].[TempGetStateItem]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[TempGetStateItem]
GO
/****** Object:  StoredProcedure [dbo].[TempGetStateItem2]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[TempGetStateItem2]
GO
/****** Object:  StoredProcedure [dbo].[TempGetStateItem3]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[TempGetStateItem3]
GO
/****** Object:  StoredProcedure [dbo].[TempGetStateItemExclusive]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[TempGetStateItemExclusive]
GO
/****** Object:  StoredProcedure [dbo].[TempGetStateItemExclusive2]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[TempGetStateItemExclusive2]
GO
/****** Object:  StoredProcedure [dbo].[TempGetStateItemExclusive3]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[TempGetStateItemExclusive3]
GO
/****** Object:  StoredProcedure [dbo].[UpdateCompoundedDrugsCheckedBy]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[UpdateCompoundedDrugsCheckedBy]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserProfile]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[UpdateUserProfile]
GO
/****** Object:  Table [dbo].[WarfarinTracking]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[WarfarinTracking] DROP CONSTRAINT [FK_WarfarinTracking_Patients]
GO
ALTER TABLE [dbo].[WarfarinTracking] DROP CONSTRAINT [DF_WarfarinTracking_EnteredDateTime]
GO
DROP TABLE [dbo].[WarfarinTracking]
GO
/****** Object:  StoredProcedure [dbo].[GetWarfarinInrGoal]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetWarfarinInrGoal]
GO
/****** Object:  Table [dbo].[TaskLogsTracking]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[TaskLogsTracking] DROP CONSTRAINT [FK_TaskLogsTracking_Sites]
GO
DROP TABLE [dbo].[TaskLogsTracking]
GO
/****** Object:  Table [dbo].[WarfarinInr]    Script Date: 01/01/2015 22:24:26 ******/
DROP TABLE [dbo].[WarfarinInr]
GO
/****** Object:  Table [dbo].[UserLog]    Script Date: 01/01/2015 22:24:26 ******/
DROP TABLE [dbo].[UserLog]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 01/01/2015 22:24:26 ******/
DROP TABLE [dbo].[UserRoles]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01/01/2015 22:24:26 ******/
DROP TABLE [dbo].[Users]
GO
/****** Object:  StoredProcedure [dbo].[TempGetVersion]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[TempGetVersion]
GO
/****** Object:  Table [dbo].[TaskLogStatus]    Script Date: 01/01/2015 22:24:26 ******/
DROP TABLE [dbo].[TaskLogStatus]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 01/01/2015 22:24:26 ******/
DROP TABLE [dbo].[Tasks]
GO
/****** Object:  Table [dbo].[Temperature]    Script Date: 01/01/2015 22:24:26 ******/
DROP TABLE [dbo].[Temperature]
GO
/****** Object:  Table [dbo].[pharmabaseTempApplications]    Script Date: 01/01/2015 22:24:25 ******/
DROP TABLE [dbo].[pharmabaseTempApplications]
GO
/****** Object:  Table [dbo].[pharmabaseTempSessions]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[pharmabaseTempSessions] DROP CONSTRAINT [DF__pharmabas__Creat__2DE6D218]
GO
ALTER TABLE [dbo].[pharmabaseTempSessions] DROP CONSTRAINT [DF__pharmabas__Flags__2EDAF651]
GO
DROP TABLE [dbo].[pharmabaseTempSessions]
GO
/****** Object:  Table [dbo].[Physicians]    Script Date: 01/01/2015 22:24:26 ******/
DROP TABLE [dbo].[Physicians]
GO
/****** Object:  Table [dbo].[Sites]    Script Date: 01/01/2015 22:24:26 ******/
DROP TABLE [dbo].[Sites]
GO
/****** Object:  Table [dbo].[TaskLog]    Script Date: 01/01/2015 22:24:26 ******/
DROP TABLE [dbo].[TaskLog]
GO
/****** Object:  Table [dbo].[CompanyInfo]    Script Date: 01/01/2015 22:24:25 ******/
DROP TABLE [dbo].[CompanyInfo]
GO
/****** Object:  Table [dbo].[CompoundedDrugs]    Script Date: 01/01/2015 22:24:25 ******/
DROP TABLE [dbo].[CompoundedDrugs]
GO
/****** Object:  Table [dbo].[CompoundedLookup]    Script Date: 01/01/2015 22:24:25 ******/
DROP TABLE [dbo].[CompoundedLookup]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 01/01/2015 22:24:25 ******/
DROP TABLE [dbo].[Content]
GO
/****** Object:  Table [dbo].[CorrectiveActions]    Script Date: 01/01/2015 22:24:25 ******/
DROP TABLE [dbo].[CorrectiveActions]
GO
/****** Object:  StoredProcedure [dbo].[CreateFullBackup]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[CreateFullBackup]
GO
/****** Object:  StoredProcedure [dbo].[CreateTempTables]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[CreateTempTables]
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 01/01/2015 22:24:24 ******/
DROP TABLE [dbo].[Actions]
GO
/****** Object:  Table [dbo].[Allergies]    Script Date: 01/01/2015 22:24:24 ******/
DROP TABLE [dbo].[Allergies]
GO
/****** Object:  Table [dbo].[AntibioticIndications]    Script Date: 01/01/2015 22:24:24 ******/
DROP TABLE [dbo].[AntibioticIndications]
GO
/****** Object:  Table [dbo].[AntibioticsCostSavingsTrackingLookup]    Script Date: 01/01/2015 22:24:25 ******/
DROP TABLE [dbo].[AntibioticsCostSavingsTrackingLookup]
GO
/****** Object:  Table [dbo].[Doses]    Script Date: 01/01/2015 22:24:25 ******/
DROP TABLE [dbo].[Doses]
GO
/****** Object:  Table [dbo].[Drugs]    Script Date: 01/01/2015 22:24:25 ******/
DROP TABLE [dbo].[Drugs]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 01/01/2015 22:24:25 ******/
DROP TABLE [dbo].[Equipment]
GO
/****** Object:  Table [dbo].[Frequencies]    Script Date: 01/01/2015 22:24:25 ******/
DROP TABLE [dbo].[Frequencies]
GO
/****** Object:  StoredProcedure [dbo].[GetMajorVersion]    Script Date: 01/01/2015 22:24:29 ******/
DROP PROCEDURE [dbo].[GetMajorVersion]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[Patients] DROP CONSTRAINT [FK_Patients_Patients]
GO
DROP TABLE [dbo].[Patients]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patients](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[SiteID] [int] NOT NULL,
	[PatientIN] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Age] [varchar](50) NULL,
	[DOB] [datetime] NULL,
	[Height] [varchar](50) NULL,
	[Weight] [varchar](50) NULL,
	[Sex] [varchar](50) NULL,
	[Room] [nchar](10) NULL,
	[EnteredBy] [varchar](50) NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetMajorVersion]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/*****************************************************************************/

CREATE PROCEDURE [dbo].[GetMajorVersion]
    @@ver int OUTPUT
AS
BEGIN
	DECLARE @version        nchar(100)
	DECLARE @dot            int
	DECLARE @hyphen         int
	DECLARE @SqlToExec      nchar(4000)

	SELECT @@ver = 7
	SELECT @version = @@Version
	SELECT @hyphen  = CHARINDEX(N' - ', @version)
	IF (NOT(@hyphen IS NULL) AND @hyphen > 0)
	BEGIN
		SELECT @hyphen = @hyphen + 3
		SELECT @dot    = CHARINDEX(N'.', @version, @hyphen)
		IF (NOT(@dot IS NULL) AND @dot > @hyphen)
		BEGIN
			SELECT @version = SUBSTRING(@version, @hyphen, @dot - @hyphen)
			SELECT @@ver     = CONVERT(int, @version)
		END
	END
END
GO
/****** Object:  Table [dbo].[Frequencies]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Frequencies](
	[FrequencyID] [int] IDENTITY(1,1) NOT NULL,
	[frequency] [varchar](50) NULL,
	[Description] [varchar](150) NULL,
 CONSTRAINT [PK_Frequencies] PRIMARY KEY CLUSTERED 
(
	[FrequencyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Equipment](
	[EquipmentID] [int] IDENTITY(1,1) NOT NULL,
	[Equipment] [varchar](250) NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Drugs]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Drugs](
	[DrugID] [int] IDENTITY(1,1) NOT NULL,
	[Drug] [varchar](150) NULL,
 CONSTRAINT [PK_Drugs] PRIMARY KEY CLUSTERED 
(
	[DrugID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Doses]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Doses](
	[DoseID] [int] IDENTITY(1,1) NOT NULL,
	[Dose] [varchar](50) NULL,
	[Description] [varchar](150) NULL,
 CONSTRAINT [PK_Doses] PRIMARY KEY CLUSTERED 
(
	[DoseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AntibioticsCostSavingsTrackingLookup]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AntibioticsCostSavingsTrackingLookup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](150) NULL,
	[Type] [varchar](150) NULL,
	[Conversion] [decimal](18, 9) NULL,
	[Cost] [decimal](18, 2) NULL,
	[FreqNumber] [int] NULL,
 CONSTRAINT [PK_AntibioticsCostSavingsTrackingLookup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AntibioticIndications]    Script Date: 01/01/2015 22:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AntibioticIndications](
	[AntibiotcIndicationID] [int] IDENTITY(1,1) NOT NULL,
	[AntibioticIndication] [varchar](150) NULL,
 CONSTRAINT [PK_AntibiotcIndications] PRIMARY KEY CLUSTERED 
(
	[AntibiotcIndicationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Allergies]    Script Date: 01/01/2015 22:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Allergies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Allergy] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 01/01/2015 22:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Actions](
	[ActionID] [int] IDENTITY(1,1) NOT NULL,
	[Action] [varchar](250) NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[CreateTempTables]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[CreateTempTables]
        AS
            CREATE TABLE [pharmabase].dbo.pharmabaseTempSessions (
                SessionId           nvarchar(88)    NOT NULL PRIMARY KEY,
                Created             datetime        NOT NULL DEFAULT GETUTCDATE(),
                Expires             datetime        NOT NULL,
                LockDate            datetime        NOT NULL,
                LockDateLocal       datetime        NOT NULL,
                LockCookie          int             NOT NULL,
                Timeout             int             NOT NULL,
                Locked              bit             NOT NULL,
                SessionItemShort    varbinary(7000) NULL,
                SessionItemLong     image           NULL,
                Flags               int             NOT NULL DEFAULT 0,
            ) 

            CREATE NONCLUSTERED INDEX Index_Expires ON [pharmabase].dbo.pharmabaseTempSessions(Expires)

            CREATE TABLE [pharmabase].dbo.pharmabaseTempApplications (
                AppId               int             NOT NULL PRIMARY KEY,
                AppName             char(280)       NOT NULL,
            ) 

            CREATE NONCLUSTERED INDEX Index_AppName ON [pharmabase].dbo.pharmabaseTempApplications(AppName)

            RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[CreateFullBackup]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[CreateFullBackup]
	
AS
BEGIN

DECLARE @name VARCHAR(50) -- database name  
DECLARE @path VARCHAR(256) -- path for backup files  
DECLARE @fileName VARCHAR(256) -- filename for backup  
DECLARE @fileDate VARCHAR(20) -- used for file name

-- specify database 
SET @name = 'pharmabase'
 
-- specify database backup directory
SET @path = 'C:\Sql_Bak\'  
 
-- specify filename format
SELECT @fileDate = CONVERT(VARCHAR(20),GETDATE(),112) + REPLACE(CONVERT(VARCHAR(20),GETDATE(),108),':','')

SET @fileName = @path + @name + '_' + @fileDate + '.BAK'

BACKUP DATABASE @name TO DISK = @fileName WITH
NOFORMAT, NOINIT, NAME = N'pharmabase-Full database Backup', SKIP,
NOREWIND, NOUNLOAD, STATS = 10    
END
GO
/****** Object:  Table [dbo].[CorrectiveActions]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CorrectiveActions](
	[CorrectiveActionID] [int] IDENTITY(1,1) NOT NULL,
	[CorrectiveAction] [varchar](max) NULL,
 CONSTRAINT [PK_CorrectiveActions] PRIMARY KEY CLUSTERED 
(
	[CorrectiveActionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Content]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Content](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pagename] [varchar](50) NULL,
	[content1] [varchar](max) NULL,
	[content2] [varchar](max) NULL,
	[content3] [varchar](max) NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompoundedLookup]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompoundedLookup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[type] [varchar](50) NULL,
 CONSTRAINT [PK_CompoundedLookup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompoundedDrugs]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompoundedDrugs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SiteID] [int] NOT NULL,
	[Date_entered] [datetime] NULL,
	[Drug] [varchar](150) NULL,
	[Concentration] [varchar](50) NULL,
	[Strength] [varchar](50) NULL,
	[Form] [varchar](50) NULL,
	[Qty] [varchar](50) NULL,
	[Size] [varchar](50) NULL,
	[Internal_Lot_Number] [varchar](50) NULL,
	[Expiry_Date] [datetime] NULL,
	[Expiry_Time] [time](7) NULL,
	[PreparedBy] [varchar](50) NULL,
	[CheckedBy] [varchar](50) NULL,
 CONSTRAINT [PK_CompoundedDrugs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompanyInfo]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](500) NULL,
	[Email] [varchar](150) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Url] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaskLog]    Script Date: 01/01/2015 22:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskLog](
	[TaskID] [int] IDENTITY(1,1) NOT NULL,
	[SiteID] [int] NOT NULL,
	[Equipment] [varchar](150) NULL,
	[Task] [varchar](150) NULL,
	[Created] [datetime] NULL,
 CONSTRAINT [PK_TaskLog] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sites]    Script Date: 01/01/2015 22:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sites](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SiteName] [varchar](250) NULL,
	[Active] [bit] NULL,
	[Interventions] [bit] NULL,
	[TempTaskLog] [bit] NULL,
	[AntibioticTracking] [bit] NULL,
	[WarfarinTracking] [bit] NULL,
	[TaskLogsTracking] [bit] NULL,
	[CompoundingLog] [bit] NULL,
 CONSTRAINT [PK_Sites] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Physicians]    Script Date: 01/01/2015 22:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Physicians](
	[PhysicianID] [int] IDENTITY(1,1) NOT NULL,
	[SiteID] [int] NULL,
	[PhysicianFirstName] [varchar](50) NULL,
	[PhysicianLastName] [varchar](50) NULL,
	[PhysicianPhone] [varchar](50) NULL,
	[PhysicianEmail] [varchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Physicians] PRIMARY KEY CLUSTERED 
(
	[PhysicianID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pharmabaseTempSessions]    Script Date: 01/01/2015 22:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pharmabaseTempSessions](
	[SessionId] [nvarchar](88) NOT NULL,
	[Created] [datetime] NOT NULL DEFAULT (getutcdate()),
	[Expires] [datetime] NOT NULL,
	[LockDate] [datetime] NOT NULL,
	[LockDateLocal] [datetime] NOT NULL,
	[LockCookie] [int] NOT NULL,
	[Timeout] [int] NOT NULL,
	[Locked] [bit] NOT NULL,
	[SessionItemShort] [varbinary](7000) NULL,
	[SessionItemLong] [image] NULL,
	[Flags] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Index_Expires] ON [dbo].[pharmabaseTempSessions] 
(
	[Expires] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pharmabaseTempApplications]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pharmabaseTempApplications](
	[AppId] [int] NOT NULL,
	[AppName] [char](280) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AppId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Index_AppName] ON [dbo].[pharmabaseTempApplications] 
(
	[AppName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temperature]    Script Date: 01/01/2015 22:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Temperature](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Temperature] [varchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 01/01/2015 22:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tasks](
	[TaskID] [int] IDENTITY(1,1) NOT NULL,
	[Task] [varchar](250) NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaskLogStatus]    Script Date: 01/01/2015 22:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskLogStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](250) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[TempGetVersion]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/*****************************************************************************/

CREATE PROCEDURE [dbo].[TempGetVersion]
    @ver      char(10) OUTPUT
AS
    SELECT @ver = "2"
    RETURN 0
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01/01/2015 22:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[guid] [uniqueidentifier] NULL,
	[UserID] [varchar](50) NULL,
	[SiteID] [int] NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](150) NULL,
	[Phone] [varchar](50) NULL,
	[UserRole] [int] NOT NULL,
	[Password] [varchar](150) NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[ZipCode] [varchar](10) NULL,
	[Active] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 01/01/2015 22:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserRoles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserLog]    Script Date: 01/01/2015 22:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[LoginType] [varchar](50) NULL,
 CONSTRAINT [PK_UserLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_UserLog] ON [dbo].[UserLog] 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WarfarinInr]    Script Date: 01/01/2015 22:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WarfarinInr](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[inr_goal] [varchar](50) NULL,
	[Description] [varchar](150) NULL,
 CONSTRAINT [PK_WarfarinInrGoal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaskLogsTracking]    Script Date: 01/01/2015 22:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskLogsTracking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SiteID] [int] NULL,
	[TaskDescription] [varchar](250) NULL,
	[Status] [varchar](50) NULL,
	[DueDate] [datetime] NULL,
	[DueTime] [varchar](50) NULL,
	[AssignedTo] [varchar](150) NULL,
	[IsRequrring] [bit] NULL,
	[Frequency] [varchar](150) NULL,
	[WeeklyFrequency] [varchar](150) NULL,
	[MonthlyFrequency] [varchar](150) NULL,
	[EmailFrequency] [varchar](250) NULL,
	[Comments] [text] NULL,
	[EnteredDateTime] [datetime] NULL,
	[EnteredBy] [varchar](50) NULL,
	[CompletedDateTime] [datetime] NULL,
	[CompletedBy] [varchar](50) NULL,
	[UpdatedDateTime] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_TaskLogsTracking] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetWarfarinInrGoal]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetWarfarinInrGoal]
	-- Add the parameters for the stored procedure here
	@ID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from WarfarinInr ORDER BY inr_goal
END
GO
/****** Object:  Table [dbo].[WarfarinTracking]    Script Date: 01/01/2015 22:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WarfarinTracking](
	[WarfarinTrackingID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[DateStarted] [datetime] NULL,
	[PrevAdmitionDate] [datetime] NULL,
	[PreviousHistoryWarfarin] [text] NULL,
	[CounselingCompletedDate] [datetime] NULL,
	[CounselingCompletedUser] [varchar](150) NULL,
	[EnteredDateTime] [datetime] NULL CONSTRAINT [DF_WarfarinTracking_EnteredDateTime]  DEFAULT (getdate()),
	[EnteredBy] [varchar](50) NULL,
 CONSTRAINT [PK_WarfarinTracking] PRIMARY KEY CLUSTERED 
(
	[WarfarinTrackingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserProfile]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[UpdateUserProfile]
      -- Add the parameters for the stored procedure here
      @UserID varchar(50),
      @Password varchar(50),
      @Address varchar(50)=null,
      @City varchar(50)=null,
      @State varchar(50)= null,
      @ZipCode varchar(10)=null,
      @FirstName varchar(50)=null,
      @LastName varchar(50)=null,
      @Email varchar(50)=null,
      @Phone varchar(50)=null
      
     
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;
 
    -- Insert statements for procedure here
            UPDATE [Users]
            SET
           [Password]=@Password
          ,[Address]=@Address
          ,[City]=@City
          ,[State]=@State
          ,[Zipcode]=@ZipCode
          ,[FirstName] = @FirstName
          ,[LastName] = @LastName
          ,[Email] = @Email
          ,[Phone] = @Phone
          WHERE [UserID] = @UserID
      
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCompoundedDrugsCheckedBy]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[UpdateCompoundedDrugsCheckedBy]
	-- Add the parameters for the stored procedure here
	@ID int = null,
    @CheckedBy varchar(50)=null
   AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		UPDATE [CompoundedDrugs]
		SET	[CheckedBy] = @CheckedBy
			WHERE ID=@ID 

END
GO
/****** Object:  StoredProcedure [dbo].[TempGetStateItemExclusive3]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TempGetStateItemExclusive3]
            @id         tSessionId,
            @itemShort  tSessionItemShort OUTPUT,
            @locked     bit OUTPUT,
            @lockAge    int OUTPUT,
            @lockCookie int OUTPUT,
            @actionFlags int OUTPUT
        AS
            DECLARE @textptr AS tTextPtr
            DECLARE @length AS int
            DECLARE @now AS datetime
            DECLARE @nowLocal AS datetime

            SET @now = GETUTCDATE()
            SET @nowLocal = GETDATE()
            
            UPDATE [pharmabase].dbo.pharmabaseTempSessions
            SET Expires = DATEADD(n, Timeout, @now), 
                LockDate = CASE Locked
                    WHEN 0 THEN @now
                    ELSE LockDate
                    END,
                LockDateLocal = CASE Locked
                    WHEN 0 THEN @nowLocal
                    ELSE LockDateLocal
                    END,
                @lockAge = CASE Locked
                    WHEN 0 THEN 0
                    ELSE DATEDIFF(second, LockDate, @now)
                    END,
                @lockCookie = LockCookie = CASE Locked
                    WHEN 0 THEN LockCookie + 1
                    ELSE LockCookie
                    END,
                @itemShort = CASE Locked
                    WHEN 0 THEN SessionItemShort
                    ELSE NULL
                    END,
                @textptr = CASE Locked
                    WHEN 0 THEN TEXTPTR(SessionItemLong)
                    ELSE NULL
                    END,
                @length = CASE Locked
                    WHEN 0 THEN DATALENGTH(SessionItemLong)
                    ELSE NULL
                    END,
                @locked = Locked,
                Locked = 1,

                /* If the Uninitialized flag (0x1) if it is set,
                   remove it and return InitializeItem (0x1) in actionFlags */
                Flags = CASE
                    WHEN (Flags & 1) <> 0 THEN (Flags & ~1)
                    ELSE Flags
                    END,
                @actionFlags = CASE
                    WHEN (Flags & 1) <> 0 THEN 1
                    ELSE 0
                    END
            WHERE SessionId = @id
            IF @length IS NOT NULL BEGIN
                READTEXT [pharmabase].dbo.pharmabaseTempSessions.SessionItemLong @textptr 0 @length
            END

            RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[TempGetStateItemExclusive2]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TempGetStateItemExclusive2]
            @id         tSessionId,
            @itemShort  tSessionItemShort OUTPUT,
            @locked     bit OUTPUT,
            @lockAge    int OUTPUT,
            @lockCookie int OUTPUT
        AS
            DECLARE @textptr AS tTextPtr
            DECLARE @length AS int
            DECLARE @now AS datetime
            DECLARE @nowLocal AS datetime

            SET @now = GETUTCDATE()
            SET @nowLocal = GETDATE()
            
            UPDATE [pharmabase].dbo.pharmabaseTempSessions
            SET Expires = DATEADD(n, Timeout, @now), 
                LockDate = CASE Locked
                    WHEN 0 THEN @now
                    ELSE LockDate
                    END,
                LockDateLocal = CASE Locked
                    WHEN 0 THEN @nowLocal
                    ELSE LockDateLocal
                    END,
                @lockAge = CASE Locked
                    WHEN 0 THEN 0
                    ELSE DATEDIFF(second, LockDate, @now)
                    END,
                @lockCookie = LockCookie = CASE Locked
                    WHEN 0 THEN LockCookie + 1
                    ELSE LockCookie
                    END,
                @itemShort = CASE Locked
                    WHEN 0 THEN SessionItemShort
                    ELSE NULL
                    END,
                @textptr = CASE Locked
                    WHEN 0 THEN TEXTPTR(SessionItemLong)
                    ELSE NULL
                    END,
                @length = CASE Locked
                    WHEN 0 THEN DATALENGTH(SessionItemLong)
                    ELSE NULL
                    END,
                @locked = Locked,
                Locked = 1
            WHERE SessionId = @id
            IF @length IS NOT NULL BEGIN
                READTEXT [pharmabase].dbo.pharmabaseTempSessions.SessionItemLong @textptr 0 @length
            END

            RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[TempGetStateItemExclusive]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TempGetStateItemExclusive]
            @id         tSessionId,
            @itemShort  tSessionItemShort OUTPUT,
            @locked     bit OUTPUT,
            @lockDate   datetime OUTPUT,
            @lockCookie int OUTPUT
        AS
            DECLARE @textptr AS tTextPtr
            DECLARE @length AS int
            DECLARE @now AS datetime
            DECLARE @nowLocal AS datetime

            SET @now = GETUTCDATE()
            SET @nowLocal = GETDATE()
            
            UPDATE [pharmabase].dbo.pharmabaseTempSessions
            SET Expires = DATEADD(n, Timeout, @now), 
                LockDate = CASE Locked
                    WHEN 0 THEN @now
                    ELSE LockDate
                    END,
                @lockDate = LockDateLocal = CASE Locked
                    WHEN 0 THEN @nowLocal
                    ELSE LockDateLocal
                    END,
                @lockCookie = LockCookie = CASE Locked
                    WHEN 0 THEN LockCookie + 1
                    ELSE LockCookie
                    END,
                @itemShort = CASE Locked
                    WHEN 0 THEN SessionItemShort
                    ELSE NULL
                    END,
                @textptr = CASE Locked
                    WHEN 0 THEN TEXTPTR(SessionItemLong)
                    ELSE NULL
                    END,
                @length = CASE Locked
                    WHEN 0 THEN DATALENGTH(SessionItemLong)
                    ELSE NULL
                    END,
                @locked = Locked,
                Locked = 1
            WHERE SessionId = @id
            IF @length IS NOT NULL BEGIN
                READTEXT [pharmabase].dbo.pharmabaseTempSessions.SessionItemLong @textptr 0 @length
            END

            RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[TempGetStateItem3]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TempGetStateItem3]
            @id         tSessionId,
            @itemShort  tSessionItemShort OUTPUT,
            @locked     bit OUTPUT,
            @lockAge    int OUTPUT,
            @lockCookie int OUTPUT,
            @actionFlags int OUTPUT
        AS
            DECLARE @textptr AS tTextPtr
            DECLARE @length AS int
            DECLARE @now AS datetime
            SET @now = GETUTCDATE()

            UPDATE [pharmabase].dbo.pharmabaseTempSessions
            SET Expires = DATEADD(n, Timeout, @now), 
                @locked = Locked,
                @lockAge = DATEDIFF(second, LockDate, @now),
                @lockCookie = LockCookie,
                @itemShort = CASE @locked
                    WHEN 0 THEN SessionItemShort
                    ELSE NULL
                    END,
                @textptr = CASE @locked
                    WHEN 0 THEN TEXTPTR(SessionItemLong)
                    ELSE NULL
                    END,
                @length = CASE @locked
                    WHEN 0 THEN DATALENGTH(SessionItemLong)
                    ELSE NULL
                    END,

                /* If the Uninitialized flag (0x1) if it is set,
                   remove it and return InitializeItem (0x1) in actionFlags */
                Flags = CASE
                    WHEN (Flags & 1) <> 0 THEN (Flags & ~1)
                    ELSE Flags
                    END,
                @actionFlags = CASE
                    WHEN (Flags & 1) <> 0 THEN 1
                    ELSE 0
                    END
            WHERE SessionId = @id
            IF @length IS NOT NULL BEGIN
                READTEXT [pharmabase].dbo.pharmabaseTempSessions.SessionItemLong @textptr 0 @length
            END

            RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[TempGetStateItem2]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TempGetStateItem2]
            @id         tSessionId,
            @itemShort  tSessionItemShort OUTPUT,
            @locked     bit OUTPUT,
            @lockAge    int OUTPUT,
            @lockCookie int OUTPUT
        AS
            DECLARE @textptr AS tTextPtr
            DECLARE @length AS int
            DECLARE @now AS datetime
            SET @now = GETUTCDATE()

            UPDATE [pharmabase].dbo.pharmabaseTempSessions
            SET Expires = DATEADD(n, Timeout, @now), 
                @locked = Locked,
                @lockAge = DATEDIFF(second, LockDate, @now),
                @lockCookie = LockCookie,
                @itemShort = CASE @locked
                    WHEN 0 THEN SessionItemShort
                    ELSE NULL
                    END,
                @textptr = CASE @locked
                    WHEN 0 THEN TEXTPTR(SessionItemLong)
                    ELSE NULL
                    END,
                @length = CASE @locked
                    WHEN 0 THEN DATALENGTH(SessionItemLong)
                    ELSE NULL
                    END
            WHERE SessionId = @id
            IF @length IS NOT NULL BEGIN
                READTEXT [pharmabase].dbo.pharmabaseTempSessions.SessionItemLong @textptr 0 @length
            END

            RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[TempGetStateItem]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TempGetStateItem]
            @id         tSessionId,
            @itemShort  tSessionItemShort OUTPUT,
            @locked     bit OUTPUT,
            @lockDate   datetime OUTPUT,
            @lockCookie int OUTPUT
        AS
            DECLARE @textptr AS tTextPtr
            DECLARE @length AS int
            DECLARE @now AS datetime
            SET @now = GETUTCDATE()

            UPDATE [pharmabase].dbo.pharmabaseTempSessions
            SET Expires = DATEADD(n, Timeout, @now), 
                @locked = Locked,
                @lockDate = LockDateLocal,
                @lockCookie = LockCookie,
                @itemShort = CASE @locked
                    WHEN 0 THEN SessionItemShort
                    ELSE NULL
                    END,
                @textptr = CASE @locked
                    WHEN 0 THEN TEXTPTR(SessionItemLong)
                    ELSE NULL
                    END,
                @length = CASE @locked
                    WHEN 0 THEN DATALENGTH(SessionItemLong)
                    ELSE NULL
                    END
            WHERE SessionId = @id
            IF @length IS NOT NULL BEGIN
                READTEXT [pharmabase].dbo.pharmabaseTempSessions.SessionItemLong @textptr 0 @length
            END

            RETURN 0
GO
/****** Object:  Table [dbo].[TaskLogDetails]    Script Date: 01/01/2015 22:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskLogDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TaskID] [int] NOT NULL,
	[Degree] [varchar](50) NULL,
	[DueDate] [datetime] NULL,
	[ActionNeeded] [varchar](250) NULL,
	[ActionTaken] [varchar](max) NULL,
	[Status] [varchar](50) NULL,
	[UserID] [varchar](50) NULL,
 CONSTRAINT [PK_TaskLogDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[TempUpdateStateItemShortNullLong]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TempUpdateStateItemShortNullLong]
            @id         tSessionId,
            @itemShort  tSessionItemShort,
            @timeout    int,
            @lockCookie int
        AS    
            UPDATE [pharmabase].dbo.pharmabaseTempSessions
            SET Expires = DATEADD(n, @timeout, GETUTCDATE()), 
                SessionItemShort = @itemShort, 
                SessionItemLong = NULL, 
                Timeout = @timeout,
                Locked = 0
            WHERE SessionId = @id AND LockCookie = @lockCookie

            RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[TempUpdateStateItemShort]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TempUpdateStateItemShort]
            @id         tSessionId,
            @itemShort  tSessionItemShort,
            @timeout    int,
            @lockCookie int
        AS    
            UPDATE [pharmabase].dbo.pharmabaseTempSessions
            SET Expires = DATEADD(n, @timeout, GETUTCDATE()), 
                SessionItemShort = @itemShort, 
                Timeout = @timeout,
                Locked = 0
            WHERE SessionId = @id AND LockCookie = @lockCookie

            RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[TempUpdateStateItemLongNullShort]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TempUpdateStateItemLongNullShort]
            @id         tSessionId,
            @itemLong   tSessionItemLong,
            @timeout    int,
            @lockCookie int
        AS    
            UPDATE [pharmabase].dbo.pharmabaseTempSessions
            SET Expires = DATEADD(n, @timeout, GETUTCDATE()), 
                SessionItemLong = @itemLong, 
                SessionItemShort = NULL,
                Timeout = @timeout,
                Locked = 0
            WHERE SessionId = @id AND LockCookie = @lockCookie

            RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[TempUpdateStateItemLong]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TempUpdateStateItemLong]
            @id         tSessionId,
            @itemLong   tSessionItemLong,
            @timeout    int,
            @lockCookie int
        AS    
            UPDATE [pharmabase].dbo.pharmabaseTempSessions
            SET Expires = DATEADD(n, @timeout, GETUTCDATE()), 
                SessionItemLong = @itemLong,
                Timeout = @timeout,
                Locked = 0
            WHERE SessionId = @id AND LockCookie = @lockCookie

            RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[TempResetTimeout]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TempResetTimeout]
            @id     tSessionId
        AS
            UPDATE [pharmabase].dbo.pharmabaseTempSessions
            SET Expires = DATEADD(n, Timeout, GETUTCDATE())
            WHERE SessionId = @id
            RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[TempRemoveStateItem]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TempRemoveStateItem]
        @id     tSessionId,
        @lockCookie int
    AS
        DELETE [pharmabase].dbo.pharmabaseTempSessions
        WHERE SessionId = @id AND LockCookie = @lockCookie
        RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[TempReleaseStateItemExclusive]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TempReleaseStateItemExclusive]
            @id         tSessionId,
            @lockCookie int
        AS
            UPDATE [pharmabase].dbo.pharmabaseTempSessions
            SET Expires = DATEADD(n, Timeout, GETUTCDATE()), 
                Locked = 0
            WHERE SessionId = @id AND LockCookie = @lockCookie

            RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[TempInsertUninitializedItem]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TempInsertUninitializedItem]
            @id         tSessionId,
            @itemShort  tSessionItemShort,
            @timeout    int
        AS    

            DECLARE @now AS datetime
            DECLARE @nowLocal AS datetime
            
            SET @now = GETUTCDATE()
            SET @nowLocal = GETDATE()

            INSERT [pharmabase].dbo.pharmabaseTempSessions 
                (SessionId, 
                 SessionItemShort, 
                 Timeout, 
                 Expires, 
                 Locked, 
                 LockDate,
                 LockDateLocal,
                 LockCookie,
                 Flags) 
            VALUES 
                (@id, 
                 @itemShort, 
                 @timeout, 
                 DATEADD(n, @timeout, @now), 
                 0, 
                 @now,
                 @nowLocal,
                 1,
                 1)

            RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[TempInsertStateItemShort]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TempInsertStateItemShort]
            @id         tSessionId,
            @itemShort  tSessionItemShort,
            @timeout    int
        AS    

            DECLARE @now AS datetime
            DECLARE @nowLocal AS datetime
            
            SET @now = GETUTCDATE()
            SET @nowLocal = GETDATE()

            INSERT [pharmabase].dbo.pharmabaseTempSessions 
                (SessionId, 
                 SessionItemShort, 
                 Timeout, 
                 Expires, 
                 Locked, 
                 LockDate,
                 LockDateLocal,
                 LockCookie) 
            VALUES 
                (@id, 
                 @itemShort, 
                 @timeout, 
                 DATEADD(n, @timeout, @now), 
                 0, 
                 @now,
                 @nowLocal,
                 1)

            RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[TempInsertStateItemLong]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TempInsertStateItemLong]
            @id         tSessionId,
            @itemLong   tSessionItemLong,
            @timeout    int
        AS    
            DECLARE @now AS datetime
            DECLARE @nowLocal AS datetime
            
            SET @now = GETUTCDATE()
            SET @nowLocal = GETDATE()

            INSERT [pharmabase].dbo.pharmabaseTempSessions 
                (SessionId, 
                 SessionItemLong, 
                 Timeout, 
                 Expires, 
                 Locked, 
                 LockDate,
                 LockDateLocal,
                 LockCookie) 
            VALUES 
                (@id, 
                 @itemLong, 
                 @timeout, 
                 DATEADD(n, @timeout, @now), 
                 0, 
                 @now,
                 @nowLocal,
                 1)

            RETURN 0
GO
/****** Object:  View [dbo].[PatientsView]    Script Date: 01/01/2015 22:24:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PatientsView]
AS
SELECT     PatientID, SiteID, PatientIN, FirstName, LastName, Age, DOB, Height, Weight, Sex, Room, EnteredBy, FirstName + ' ' + LastName AS FullName
FROM         dbo.Patients
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[5] 2[6] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Patients"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PatientsView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PatientsView'
GO
/****** Object:  StoredProcedure [dbo].[DeleteAllergy]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DeleteAllergy]
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from Allergies where ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAction]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAction]
	-- Add the parameters for the stored procedure here
	@ActionID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from Actions where ActionID =@ActionID 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAntibioticIndications]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DeleteAntibioticIndications]
	-- Add the parameters for the stored procedure here
	@AntibiotcIndicationID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from AntibioticIndications where AntibiotcIndicationID=@AntibiotcIndicationID
END
GO
/****** Object:  StoredProcedure [dbo].[DeletePatient]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DeletePatient]
	-- Add the parameters for the stored procedure here
	@PatientID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from Patients where PatientID=@PatientID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteLookup]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteLookup]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from CompoundedLookup where id=@id 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteTaskLog]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteTaskLog]
	-- Add the parameters for the stored procedure here
	@TaskLogID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from TaskLog where TaskID=@TaskLogID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteTask]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteTask]
	-- Add the parameters for the stored procedure here
	@TaskID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from Tasks where TaskID =@TaskID 
END
GO
/****** Object:  StoredProcedure [dbo].[DeletePhysician]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DeletePhysician]

      -- Add the parameters for the stored procedure here

      @PhysicianID int

AS

BEGIN

      -- SET NOCOUNT ON added to prevent extra result sets from

      -- interfering with SELECT statements.

      SET NOCOUNT ON;

 

    -- Insert statements for procedure here

      Delete from Physicians where PhysicianID =@PhysicianID

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteTaskLogStatus]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DeleteTaskLogStatus]
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from TaskLogStatus where ID=@ID 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteFrequency]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteFrequency]

      -- Add the parameters for the stored procedure here

      @FrequencyID int

AS

BEGIN

      -- SET NOCOUNT ON added to prevent extra result sets from

      -- interfering with SELECT statements.

      SET NOCOUNT ON;

 

    -- Insert statements for procedure here

      Delete from Frequencies where FrequencyID =@FrequencyID

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteExpiredSessions]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[DeleteExpiredSessions]
        AS
            SET NOCOUNT ON
            SET DEADLOCK_PRIORITY LOW 

            DECLARE @now datetime
            SET @now = GETUTCDATE() 

            CREATE TABLE #tblExpiredSessions 
            ( 
                SessionID nvarchar(88) NOT NULL PRIMARY KEY
            )

            INSERT #tblExpiredSessions (SessionID)
                SELECT SessionID
                FROM [pharmabase].dbo.pharmabaseTempSessions WITH (READUNCOMMITTED)
                WHERE Expires < @now

            IF @@ROWCOUNT <> 0 
            BEGIN 
                DECLARE ExpiredSessionCursor CURSOR LOCAL FORWARD_ONLY READ_ONLY
                FOR SELECT SessionID FROM #tblExpiredSessions 

                DECLARE @SessionID nvarchar(88)

                OPEN ExpiredSessionCursor

                FETCH NEXT FROM ExpiredSessionCursor INTO @SessionID

                WHILE @@FETCH_STATUS = 0 
                    BEGIN
                        DELETE FROM [pharmabase].dbo.pharmabaseTempSessions WHERE SessionID = @SessionID AND Expires < @now
                        FETCH NEXT FROM ExpiredSessionCursor INTO @SessionID
                    END

                CLOSE ExpiredSessionCursor

                DEALLOCATE ExpiredSessionCursor

            END 

            DROP TABLE #tblExpiredSessions

        RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[DeleteEquipment]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEquipment]
	@EquipmentID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from Equipment where EquipmentID=@EquipmentID 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteDrugs]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteDrugs]
		@DrugID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from Drugs where DrugID=@DrugID 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteDoses]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteDoses]
	-- Add the parameters for the stored procedure here
	@DoseID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from Doses where DoseID=@DoseID 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCorrectiveActions]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCorrectiveActions]
	-- Add the parameters for the stored procedure here
	@CorrectiveActionID int
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from CorrectiveActions where CorrectiveActionID=@CorrectiveActionID 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCompoundedLookup]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCompoundedLookup]
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from CompoundedLookup where ID=@ID
END
GO
/****** Object:  Table [dbo].[CompoundedDrugsDetails]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompoundedDrugsDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompoundedDrugID] [int] NOT NULL,
	[Additive] [varchar](150) NULL,
	[Strength] [varchar](50) NULL,
	[Concentration] [varchar](50) NULL,
	[form] [varchar](50) NULL,
	[size] [varchar](50) NULL,
	[Lot_Number] [varchar](50) NULL,
	[Mfg_expiry_date] [datetime] NULL,
	[Drug_Manufacturer] [varchar](50) NULL,
	[Qty] [varchar](50) NULL,
 CONSTRAINT [PK_CompoundedDrugsDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AntibioticsCostSavingsDaysTherapy]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AntibioticsCostSavingsDaysTherapy](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SiteID] [int] NULL,
	[Description] [varchar](150) NULL,
 CONSTRAINT [PK_AntibioticsCostSavingsDaysTherapy] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AntibioticTracking]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AntibioticTracking](
	[AntibioticTrackingID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[MedHistory] [text] NULL,
	[OtherInfo] [text] NULL,
	[EnteredDateTime] [datetime] NULL CONSTRAINT [DF_AntibioticTracking_EnteredDateTime]  DEFAULT (getdate()),
	[EnteredBy] [varchar](50) NULL,
 CONSTRAINT [PK_AntibioticTracking] PRIMARY KEY CLUSTERED 
(
	[AntibioticTrackingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateWarfarinInr]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AddUpdateWarfarinInr]
	-- Add the parameters for the stored procedure here
	@ID int= null,
	@inr_goal varchar(50),
	@Description varchar(150)= null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @ID is null 
	BEGIN
		INSERT INTO WarfarinInr (inr_goal,[Description]) values (@inr_goal ,@Description )
	END
	ELSE
	BEGIN
		UPDATE WarfarinInr Set inr_goal=@inr_goal,[Description]=@Description 
		where ID=@ID 
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateTaskLogStatus]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AddUpdateTaskLogStatus]
	-- Add the parameters for the stored procedure here
	@ID int=null,
	@Status varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @ID is null
	BEGIN
		INSERT INTO TaskLogStatus
		(Status ) Values(@Status)
	END
	ELSE
	BEGIN
		Update TaskLogStatus Set Status =@Status where ID=@ID 
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateUser]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateUser]
      -- Add the parameters for the stored procedure here
      @UserID varchar(50),
      @Password varchar(50),
      @SiteID int=null,
      @Address varchar(50)=null,
      @City varchar(50)=null,
      @State varchar(50)= null,
      @ZipCode varchar(10)=null,
      @FirstName varchar(50)=null,
      @LastName varchar(50)=null,
      @Email varchar(50)=null,
      @Phone varchar(50)=null,
      @UserRole int,
      @Active bit=null,
      @guid uniqueidentifier
     
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;
 
    -- Insert statements for procedure here
      If exists (select * from Users where UserID =@UserID )
      Begin
            UPDATE [pharmabase].[dbo].[Users]
            SET
           [SiteID] = @SiteID
          ,[Password]=@Password
          ,[Address]=@Address
          ,[City]=@City
          ,[State]=@State
          ,[Zipcode]=@ZipCode
            ,[FirstName] = @FirstName
            ,[LastName] = @LastName
            ,[Email] = @Email
            ,[Phone] = @Phone
            ,[UserRole] = @UserRole
            ,[Active]=@Active
            WHERE [UserID] = @UserID
      End
      Else
      Begin
            INSERT INTO [Users]
           ([guid]
		   ,[UserID]
           ,[SiteID]
           ,[Password]
                  ,[Address]
                  ,[City]
                  ,[State]
                  ,[Zipcode]
           ,[FirstName]
           ,[LastName]
           ,[Email]
           ,[Phone]
           ,[UserRole]
           ,[Active])
     VALUES
           (@guid
		   ,@UserID
           ,@SiteID
           ,@Password
             ,@Address
             ,@City
             ,@State
             ,@ZipCode
           ,@FirstName
           ,@LastName
           ,@Email
           ,@Phone
           ,@UserRole
           ,@Active )
      End
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateTemperature]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AddUpdateTemperature]
	-- Add the parameters for the stored procedure here
	@ID int =null,
	@Temperature varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @ID is null
	begin
		insert into Temperature (Temperature) values(@Temperature )
	end 
	else
	begin
		update Temperature set [Temperature]=@Temperature where ID=@ID 
	end
	
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateFrequency]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateFrequency]
	-- Add the parameters for the stored procedure here
	@FrequencyID int = null,
	@Frequency varchar(50),
	@Description varchar(150)=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @FrequencyID is null
	BEGIN
		INSERT INTO Frequencies 
		(Frequency,[Description])
		VALUES(@Frequency,@Description )
	END
	ELSE
	BEGIN
		UPDATE  Frequencies 
		SET Frequency = @Frequency ,[Description]=@Description 
		WHERE FrequencyID = @FrequencyID 
	END
	
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateEquipment]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateEquipment]

	@EquipmentID int=null,
	@Equipment varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if @EquipmentID is null
    begin
		insert into Equipment (Equipment ) values (@Equipment )
    end
    else
    begin
		update Equipment set Equipment =@Equipment where EquipmentID =@EquipmentID 
    end
	
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateDrugs]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateDrugs]
	-- Add the parameters for the stored procedure here
	@DrugID int=null,
	@Drug varchar(150)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @DrugID IS NULL
	BEGIN
		INSERT INTO DRUGS (Drug) values(@Drug )
		Select @@IDENTITY 
	END
	ELSE
	BEGIN
		UPDATE Drugs 
		Set Drug=@Drug 
		where DrugID=@DrugID 
		Select @DrugID 
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateDose]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateDose]
	-- Add the parameters for the stored procedure here
	@DoseID int= null,
	@Dose varchar(50),
	@Description varchar(150)= null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @DoseID is null 
	BEGIN
		INSERT INTO DOSES (Dose,[Description]) values (@Dose ,@Description )
	END
	ELSE
	BEGIN
		UPDATE Doses Set Dose=@Dose,[Description]=@Description 
		where DoseID=@DoseID 
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateCorrectiveAction]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateCorrectiveAction]
	-- Add the parameters for the stored procedure here
	@CorrectiveActionID int = null,
	@CorrectiveAction varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	If @CorrectiveActionID is null
	begin
		insert into CorrectiveActions (CorrectiveAction) values(@CorrectiveAction )
	end
	else
	begin
		update CorrectiveActions set CorrectiveAction = @CorrectiveAction 
		where CorrectiveActionID =@CorrectiveActionID 
	end
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateCompoundedLookup]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateCompoundedLookup]
	-- Add the parameters for the stored procedure here
	@ID int = null,
	@name varchar (50),
	@type varchar (50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
    if @ID is null
    begin
		INSERT INTO [CompoundedLookup]
           ([name]
           ,[type])
		VALUES
           (@name
           ,@type)
	END
	ELSE
	BEGIN
		UPDATE [CompoundedLookup]
		SET [name] = @name,[type] = @type
		WHERE ID=@ID
	END


END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateTaskLog]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateTaskLog]
      -- Add the parameters for the stored procedure here
      @TaskID int = null,
      @Equipment varchar(150),
      @Task varchar(250),
      @SiteID int
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;
 
    -- Insert statements for procedure here
      if @TaskID is null
      begin
            insert into Tasklog
            (Equipment,SiteID,Task,Created ) values (@Equipment,@SiteID,@Task,GETDATE ())
      end
      else
      begin
            update TaskLog set Equipment = @Equipment,SiteID=@SiteID,Task=@Task
            where TaskID=@TaskID
      end
     
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateTask]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateTask]
	-- Add the parameters for the stored procedure here
	@TaskID int=null,
	@Task varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @TaskID is null
	BEGIN
		INSERT INTO Tasks 
		(Task ) Values(@Task)
	END
	ELSE
	BEGIN
		Update Tasks Set Task =@Task where TaskID=@TaskID 
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateSite]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateSite]

      -- Add the parameters for the stored procedure here

      @ID int = null,

      @SiteName varchar(250),

      @Active bit,

      @Interventions bit,

      @TempTaskLog bit,

      @AntibioticTracking bit,

      @WarfarinTracking bit,

	  @TaskLogsTracking bit,

	  @CompoundingLog bit

 

AS

BEGIN

      -- SET NOCOUNT ON added to prevent extra result sets from

      -- interfering with SELECT statements.

      SET NOCOUNT ON;

 

    -- Insert statements for procedure here

      if @ID is null

      begin

            insert into Sites (SiteName,Active,Interventions,TempTaskLog,AntibioticTracking,WarfarinTracking,TaskLogsTracking,CompoundingLog ) values (@SiteName,@Active,@Interventions,@TempTaskLog,@AntibioticTracking,@WarfarinTracking,@TaskLogsTracking,@CompoundingLog)

            select @@IDENTITY

      end

      else

      begin

            Update Sites set SiteName=@SiteName

            ,Active = @Active

            ,Interventions=@Interventions

            ,TempTaskLog=@TempTaskLog

            ,AntibioticTracking=@AntibioticTracking

            ,WarfarinTracking=@WarfarinTracking

			,CompoundingLog=@CompoundingLog

			,TaskLogsTracking=@TaskLogsTracking

 

              where ID=@ID

      end

     

END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdatePhysician]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdatePhysician]
	-- Add the parameters for the stored procedure here
	@PhysicianID int = null,
	@SiteID int,
	@PhysicianFirstName varchar(50),
    @PhysicianLastName varchar(50),
    @PhysicianPhone varchar(50)=null,
    @PhysicianEmail varchar(50)=null,
    @Active bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
    if @PhysicianID is null
    Begin
		INSERT INTO [Physicians]
			   ([SiteID]
			   ,[PhysicianFirstName]
			   ,[PhysicianLastName]
			   ,[PhysicianPhone]
			   ,[PhysicianEmail]
			   ,[Active])
		 VALUES
			   (@SiteID
			   ,@PhysicianFirstName
			   ,@PhysicianLastName
			   ,@PhysicianPhone
			   ,@PhysicianEmail
			   ,@Active)
	END
	ELSE
	BEGIN
		UPDATE [Physicians]
		SET [SiteID] = @SiteID
      ,[PhysicianFirstName] = @PhysicianFirstName
      ,[PhysicianLastName] = @PhysicianLastName
      ,[PhysicianPhone] = @PhysicianPhone
      ,[PhysicianEmail] = @PhysicianEmail
      ,[Active] = @Active
		WHERE PhysicianID=@PhysicianID
	END

END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdatePatient]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdatePatient]
	-- Add the parameters for the stored procedure here
		@PatientID int = null,
		@SiteID int = null,
        @PatientIN varchar(50) ,
        @FirstName varchar(50) = null,
        @LastName varchar(50) = null,
        @Age varchar(50) = null,
        @DOB datetime = null,
        @Height varchar(50) = null,
        @Weight varchar(50) = null,
        @Sex varchar(50)= null, 
        @Room varchar(50) = null,
		@EnteredBy varchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if @PatientID is null
    BEGIN	
		INSERT INTO [Patients]
           ([SiteID]
           ,[PatientIN]
           ,[FirstName]
           ,[LastName]
           ,[Age]
           ,[DOB]
           ,[Height]
           ,[Weight]
           ,[Sex]
           ,[Room]
		   ,[EnteredBy])
		VALUES
           (@SiteID
           ,@PatientIN
           ,@FirstName
           ,@LastName
           ,@Age
           ,@DOB
           ,@Height
           ,@Weight
           ,@Sex
           ,@Room
		   ,@EnteredBy)
		   
		   SELECT SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		UPDATE [Patients]
	   SET [SiteID] = @SiteID
		  ,[PatientIN] = @PatientIN
		  ,[FirstName] = @FirstName
		  ,[LastName] = @LastName
		  ,[Age] = @Age
		  ,[DOB] = @DOB
		  ,[Height] = @Height
		  ,[Weight] = @Weight
		  ,[Sex] = @Sex
		  ,[Room] = @Room
		 WHERE PatientID=@PatientID

		 SELECT SCOPE_IDENTITY()
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateCompoundedDrugs]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateCompoundedDrugs]
	-- Add the parameters for the stored procedure here
	@ID int = null,
	@SiteID int,
	@Date_entered datetime,
	@Drug varchar(150),
	@Strength varchar(50),
    @Concentration varchar(50),
    @Form varchar(50),
    @Qty varchar(50),
	@Size varchar(50),
    @Internal_Lot_Number varchar(50)=null,
    @Expiry_Date datetime=null,
    @Expiry_Time time(7)=null,
    @PreparedBy varchar(50)=null,
    @CheckedBy varchar(50)=null
   AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
    if @ID is null
    begin
	INSERT INTO [CompoundedDrugs]
           ([SiteID]
           ,[Date_entered]
           ,[Drug]
           ,[Strength]
           ,[Concentration]
           ,[Form]
           ,[Qty]
           ,[Size]
           ,[Internal_Lot_Number]
           ,[Expiry_Date]
           ,[Expiry_Time]
           ,[PreparedBy]
           ,[CheckedBy])
     VALUES
           (@SiteID
           ,@Date_entered
           ,@Drug
           ,@Strength
           ,@Concentration
           ,@Form
           ,@Qty
           ,@Size
           ,@Internal_Lot_Number
           ,@Expiry_Date
           ,@Expiry_Time
           ,@PreparedBy
           ,@CheckedBy)
	end
	else
	begin
		UPDATE [CompoundedDrugs]
		SET	[Date_entered] = @Date_entered
		,[Drug] = @Drug
		,[Strength]=@Strength
		,[SiteID]=@SiteID
		,[Concentration] = @Concentration
		,[Form] = @Form
		,[Size] = @Size
		,[Qty]=@Qty 
		,[Internal_Lot_Number] = @Internal_Lot_Number
		,[Expiry_Date] = @Expiry_Date
		,[Expiry_Time] = @Expiry_Time
			WHERE ID=@ID 
	end

END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAntibioticIndications]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AddUpdateAntibioticIndications]
      -- Add the parameters for the stored procedure here
      @AntibioticIndicationID int = null,
      @AntibioticIndication varchar(150) = null
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

    -- Insert statements for procedure here
      IF @AntibioticIndicationID IS NULL
      BEGIN
            INSERT INTO AntibioticIndications (AntibioticIndication) values (@AntibioticIndication)
            Select @@IDENTITY
      END
      ELSE
      BEGIN
            UPDATE AntibioticIndications SET AntibioticIndication=@AntibioticIndication WHERE AntibiotcIndicationID=@AntibioticIndicationID
      END
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAntibioticsCostSavingsLookup]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateAntibioticsCostSavingsLookup]
	-- Add the parameters for the stored procedure here
	    @id int = null,
		@Description VarChar(150),
        @Type VarChar(150),
        @Conversion Decimal (18,9),
        @Cost Decimal,
        @FreqNumber int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if @id is null
    BEGIN	
		INSERT INTO [AntibioticsCostSavingsTrackingLookup]
           ([Description]
           ,[Type]
		   ,[Conversion]
		   ,[Cost]
		   ,[FreqNumber])
		VALUES
           (@Description
           ,@Type
		   ,@Conversion
		   ,@Cost
		   ,@FreqNumber)
	END
	ELSE
	BEGIN
		UPDATE [AntibioticsCostSavingsTrackingLookup]
		SET [Description] = @Description
		  ,[Type] = @Type
		  ,[Conversion] = @Conversion
		  ,[Cost] = @Cost
		  ,[FreqNumber] = @FreqNumber
		 WHERE id=@id
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAllergy]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateAllergy]
      -- Add the parameters for the stored procedure here
      @ID int = null,
      @Allergy varchar(50) = null
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

    -- Insert statements for procedure here
      IF @ID IS NULL
      BEGIN
            INSERT INTO Allergies (Allergy) values (@Allergy )
            Select @@IDENTITY
      END
      ELSE
      BEGIN
            UPDATE Allergies SET Allergy =@Allergy WHERE ID=@ID
      END
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAction]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateAction]
	-- Add the parameters for the stored procedure here
	@ActionID int =null,
	@Action varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @ActionID is null
	begin
		insert into actions (action) values(@Action )
	end 
	else
	begin
		update actions set [action]=@Action where actionid=@ActionID 
	end
	
END
GO
/****** Object:  StoredProcedure [dbo].[AddUserLog]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUserLog]
	-- Add the parameters for the stored procedure here
	@UserID varchar(50),
	@LoginType varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into userlog (UserID,EntryDate,LoginType) values (@UserID,GETDATE (),@LoginType )
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteWarfarinInr]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DeleteWarfarinInr]
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from WarfarinInr where ID=@ID 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteTemperature]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DeleteTemperature]
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from Temperature where ID =@ID 
END
GO
/****** Object:  StoredProcedure [dbo].[GetCompanyInfo]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCompanyInfo]

      -- Add the parameters for the stored procedure here

     

AS

BEGIN

      -- SET NOCOUNT ON added to prevent extra result sets from

      -- interfering with SELECT statements.

      SET NOCOUNT ON;

 

    -- Insert statements for procedure here

      SELECT * from CompanyInfo where ID=1

END
GO
/****** Object:  StoredProcedure [dbo].[GetPhysiciansBySiteID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetPhysiciansBySiteID]
	-- Add the parameters for the stored procedure here
	@SiteID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *, (PhysicianLastName + ',' + PhysicianFirstName) AS fullname from Physicians where SiteID=ISNULL(@SiteID,SiteID)
END
GO
/****** Object:  StoredProcedure [dbo].[GetPhysicians]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPhysicians]
	-- Add the parameters for the stored procedure here
	@PhysicianID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *, (PhysicianLastName + ',' + PhysicianFirstName) AS fullname from Physicians where PhysicianID=ISNULL(@PhysicianID,PhysicianID)
END
GO
/****** Object:  StoredProcedure [dbo].[GetPatientsWarfarinTracking]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetPatientsWarfarinTracking]
	-- Add the parameters for the stored procedure here
	@SiteID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Patients WHERE SiteID = @SiteID order by PatientID desc
END
GO
/****** Object:  StoredProcedure [dbo].[GetPatientsInerventions]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPatientsInerventions]
	-- Add the parameters for the stored procedure here
	@SiteID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Patients WHERE SiteID = @SiteID  order by PatientID desc
END
GO
/****** Object:  StoredProcedure [dbo].[GetPatientsAntibioticTracking]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPatientsAntibioticTracking]
	-- Add the parameters for the stored procedure here
	@SiteID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Patients WHERE SiteID = @SiteID order by PatientID desc
END
GO
/****** Object:  StoredProcedure [dbo].[GetPatients]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPatients]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from patients
END
GO
/****** Object:  StoredProcedure [dbo].[GetPatientByIN]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetPatientByIN]
	-- Add the parameters for the stored procedure here
	@PatientIN varchar(50),
	@SiteID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from patients where PatientIN=@PatientIN and SiteID=@SiteID  
	Select * from patientAlleries where PatientIN=@PatientIN and SiteID=@SiteID 
END
GO
/****** Object:  StoredProcedure [dbo].[GetHashCode]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/*****************************************************************************/

CREATE PROCEDURE [dbo].[GetHashCode]
    @input tAppName,
    @hash int OUTPUT
AS
    /* 
       This sproc is based on this C# hash function:

        int GetHashCode(string s)
        {
            int     hash = 5381;
            int     len = s.Length;

            for (int i = 0; i < len; i++) {
                int     c = Convert.ToInt32(s[i]);
                hash = ((hash << 5) + hash) ^ c;
            }

            return hash;
        }

        However, SQL 7 doesn't provide a 32-bit integer
        type that allows rollover of bits, we have to
        divide our 32bit integer into the upper and lower
        16 bits to do our calculation.
    */
       
    DECLARE @hi_16bit   int
    DECLARE @lo_16bit   int
    DECLARE @hi_t       int
    DECLARE @lo_t       int
    DECLARE @len        int
    DECLARE @i          int
    DECLARE @c          int
    DECLARE @carry      int

    SET @hi_16bit = 0
    SET @lo_16bit = 5381
    
    SET @len = DATALENGTH(@input)
    SET @i = 1
    
    WHILE (@i <= @len)
    BEGIN
        SET @c = ASCII(SUBSTRING(@input, @i, 1))

        /* Formula:                        
           hash = ((hash << 5) + hash) ^ c */

        /* hash << 5 */
        SET @hi_t = @hi_16bit * 32 /* high 16bits << 5 */
        SET @hi_t = @hi_t & 0xFFFF /* zero out overflow */
        
        SET @lo_t = @lo_16bit * 32 /* low 16bits << 5 */
        
        SET @carry = @lo_16bit & 0x1F0000 /* move low 16bits carryover to hi 16bits */
        SET @carry = @carry / 0x10000 /* >> 16 */
        SET @hi_t = @hi_t + @carry
        SET @hi_t = @hi_t & 0xFFFF /* zero out overflow */

        /* + hash */
        SET @lo_16bit = @lo_16bit + @lo_t
        SET @hi_16bit = @hi_16bit + @hi_t + (@lo_16bit / 0x10000)
        /* delay clearing the overflow */

        /* ^c */
        SET @lo_16bit = @lo_16bit ^ @c

        /* Now clear the overflow bits */	
        SET @hi_16bit = @hi_16bit & 0xFFFF
        SET @lo_16bit = @lo_16bit & 0xFFFF

        SET @i = @i + 1
    END

    /* Do a sign extension of the hi-16bit if needed */
    IF (@hi_16bit & 0x8000 <> 0)
        SET @hi_16bit = 0xFFFF0000 | @hi_16bit

    /* Merge hi and lo 16bit back together */
    SET @hi_16bit = @hi_16bit * 0x10000 /* << 16 */
    SET @hash = @hi_16bit | @lo_16bit

    RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[Getfrequencies]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Getfrequencies]
	-- Add the parameters for the stored procedure here
	@FrequencyID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from Frequencies where FrequencyID=ISNULL(@FrequencyID,FrequencyID)
END
GO
/****** Object:  StoredProcedure [dbo].[GetEquipmentByName]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEquipmentByName]
	-- Add the parameters for the stored procedure here
	@Name varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from Equipment  where [Equipment] like '%' + @Name + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[GetEquipment]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEquipment]
	-- Add the parameters for the stored procedure here
	@EquipmentID int= null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Equipment where EquipmentID = ISNULL(@EquipmentID,EquipmentID)
END
GO
/****** Object:  StoredProcedure [dbo].[GetDrugs]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDrugs]
	-- Add the parameters for the stored procedure here
	@DrugID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from Drugs where DrugID=ISNULL(@DrugID,DrugID ) order by Drug asc
END
GO
/****** Object:  StoredProcedure [dbo].[GetDose]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDose]
	-- Add the parameters for the stored procedure here
	@DoseID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from Doses where DoseID=ISNULL(@DoseID,DoseID)
END
GO
/****** Object:  StoredProcedure [dbo].[GetCorrectiveActionsByName]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCorrectiveActionsByName]
	-- Add the parameters for the stored procedure here
	@Name varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from CorrectiveActions  where [CorrectiveAction] like '%' + @Name + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[GetCorrectiveAction]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCorrectiveAction]
	-- Add the parameters for the stored procedure here
	@CorrectiveActionID int= null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from CorrectiveActions where CorrectiveActionID =isnull(@CorrectiveActionID ,CorrectiveActionID)
END
GO
/****** Object:  StoredProcedure [dbo].[GetContentByPage]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetContentByPage]

      -- Add the parameters for the stored procedure here

      @pagename varchar(50)

AS

BEGIN

      -- SET NOCOUNT ON added to prevent extra result sets from

      -- interfering with SELECT statements.

      SET NOCOUNT ON;

 

    -- Insert statements for procedure here

      SELECT * from Content where pagename=@pagename

END
GO
/****** Object:  StoredProcedure [dbo].[GetCompoundedLookupByID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetCompoundedLookupByID]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from CompoundedLookup where [id]=@id
END
GO
/****** Object:  StoredProcedure [dbo].[GetCompoundedLookup]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCompoundedLookup]
	-- Add the parameters for the stored procedure here
	@type varchar(50)=null,
	@name varchar(50)=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
declare @Pattern varchar(50)
    -- Insert statements for procedure here
    if @name is null
    BEGIN
		SELECT * from CompoundedLookup where [type]=ISNULL(@type,[type])
	END 
	ELSE
	BEGIN
		Set @Pattern= @name + '%'
		SELECT * from CompoundedLookup where [type]=ISNULL(@type,[type]) AND name like @Pattern 
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetCompoundedDrugsByID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCompoundedDrugsByID]
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from CompoundedDrugs where ID =@ID 
END
GO
/****** Object:  StoredProcedure [dbo].[GetCompoundedDrugs]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCompoundedDrugs]
	-- Add the parameters for the stored procedure here
	@SiteID int,
	@StartDate datetime = null,
	@EndDate datetime = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if @StartDate IS null
    BEGIN
		SELECT * from CompoundedDrugs where SiteID=@SiteID 
	END
	ELSE
	BEGIN
		SELECT * from CompoundedDrugs where SiteID=@SiteID AND (CompoundedDrugs.Date_entered between @StartDate and @EndDate)
	END
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllergiesByName]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllergiesByName]
	-- Add the parameters for the stored procedure here
	@Name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT * from Allergies where Allergy like '%' + @Name + '%'
	SELECT * from Allergies order by Allergy
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllergiesByID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllergiesByID]
	-- Add the parameters for the stored procedure here
	@ID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Allergies where ID=ISNULL(@ID,ID)
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllergies]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllergies]
	-- Add the parameters for the stored procedure here
	@ID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Allergies ORDER BY Allergy
END
GO
/****** Object:  StoredProcedure [dbo].[GetActionsByName]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetActionsByName]
	-- Add the parameters for the stored procedure here
	@Name varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from Actions where [Action] like '%' + @Name + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[GetActions]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetActions]
	-- Add the parameters for the stored procedure here
	@ActionID int=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from actions where actionID=ISNULL(@ActionID,ActionID)
END
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticIndications]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAntibioticIndications]
	-- Add the parameters for the stored procedure here
	@ID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from AntibioticIndications where AntibiotcIndicationID=ISNULL(@ID,AntibiotcIndicationID)
END
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticsCostSavingsTrackingLookupByType]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAntibioticsCostSavingsTrackingLookupByType]
	-- Add the parameters for the stored procedure here
	@Type varchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if (@Type = 'Frequency')
    BEGIN
		SELECT * from AntibioticsCostSavingsTrackingLookup where Type = @Type order by FreqNumber Asc
	END
	ELSE
	BEGIN
		SELECT * from AntibioticsCostSavingsTrackingLookup where Type = @Type order by Description
	END	
END
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticsCostSavingsTrackingLookupById]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetAntibioticsCostSavingsTrackingLookupById]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from AntibioticsCostSavingsTrackingLookup where id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticsCostSavingsTrackingLookup]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetAntibioticsCostSavingsTrackingLookup]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from AntibioticsCostSavingsTrackingLookup
END
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticsCostSavingsDaysTherapyByDescriptionType]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetAntibioticsCostSavingsDaysTherapyByDescriptionType]
	-- Add the parameters for the stored procedure here
	@Type varchar(150),
	@Description varchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from AntibioticsCostSavingsTrackingLookup where Type = @Type AND Description = @Description
END
GO
/****** Object:  StoredProcedure [dbo].[GetTaskLog]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetTaskLog]

      -- Add the parameters for the stored procedure here

      @TaskID int = null

AS

BEGIN

      -- SET NOCOUNT ON added to prevent extra result sets from

      -- interfering with SELECT statements.

      SET NOCOUNT ON;

 

    -- Insert statements for procedure here

      SELECT * from TaskLog where TaskID=ISNULL(@TaskID,TaskID)

END
GO
/****** Object:  StoredProcedure [dbo].[GetTaskLogStatus]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetTaskLogStatus]
	-- Add the parameters for the stored procedure here
	@ID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from TaskLogStatus ORDER BY Status
END
GO
/****** Object:  StoredProcedure [dbo].[GetSitesUsers]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[GetSitesUsers]
      -- Add the parameters for the stored procedure here
      @SiteID INT = NULL
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;
 
    -- Insert statements for procedure here
      SELECT  *, (FirstName + ' ' + LastName) as FullName FROM  Users WHERE SiteID =ISNULL(@SiteID,SiteID)
END
GO
/****** Object:  StoredProcedure [dbo].[GetSites]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSites]
	-- Add the parameters for the stored procedure here
	@ID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Sites where ID=ISNULL (@ID,ID)
END
GO
/****** Object:  Table [dbo].[Interventions]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Interventions](
	[InterventionsID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[Physician] [varchar](100) NOT NULL,
	[Minutes] [varchar](50) NULL,
	[EnteredBy] [varchar](50) NULL,
	[EnteredDateTime] [datetime] NULL CONSTRAINT [DF_Interventions_EnteredDateTime]  DEFAULT (getdate()),
	[InterventionType] [varchar](250) NULL,
 CONSTRAINT [PK_Interventions] PRIMARY KEY CLUSTERED 
(
	[InterventionsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUsers]

      -- Add the parameters for the stored procedure here

      @UserID varchar(50)= null

AS

BEGIN

      -- SET NOCOUNT ON added to prevent extra result sets from

      -- interfering with SELECT statements.

      SET NOCOUNT ON;


    -- Insert statements for procedure here

      SELECT    Users.guid, Users.UserID, Users.SiteID, Users.FirstName, Users.LastName, Users.Email, Users.Phone, Users.UserRole, Users.Password, Users.Address, Users.City,

                      Users.State, Users.ZipCode, Sites.SiteName, Users.Active, Sites.Interventions, Sites.TempTaskLog, Sites.AntibioticTracking, Sites.WarfarinTracking, Sites.TaskLogsTracking, Sites.CompoundingLog

FROM         Users LEFT OUTER JOIN

                      Sites ON Users.SiteID = Sites.ID

WHERE     (Users.UserID = ISNULL(@UserID, Users.UserID))

END
GO
/****** Object:  StoredProcedure [dbo].[GetUserRoles]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetUserRoles]
      -- Add the parameters for the stored procedure here
     
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;
 
    -- Insert statements for procedure here
      SELECT * from UserRoles
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserLogBySite]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserLogBySite]

      -- Add the parameters for the stored procedure here

    @SiteID int = null,
	@EnteredStartDateTime DATETIME = null,
	@EnteredEndDateTime DATETIME = null
AS

BEGIN

      -- SET NOCOUNT ON added to prevent extra result sets from

      -- interfering with SELECT statements.

      SET NOCOUNT ON;


    -- Insert statements for procedure here
SELECT     @EnteredStartDateTime as StartDate, @EnteredEndDateTime as EndDate, Users.FirstName + ' ' + Users.LastName As UserName, UserLog.EntryDate
FROM         Users INNER JOIN
                      UserLog ON Users.UserID = UserLog.UserID
WHERE     (Users.SiteID = @SiteID and UserLog.EntryDate >= @EnteredStartDateTime and UserLog.EntryDate < DATEADD(DAY,1,@EnteredEndDateTime))
      
END
GO
/****** Object:  StoredProcedure [dbo].[GetTemperatures]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetTemperatures]
	-- Add the parameters for the stored procedure here
	@TemperatureID int=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Temperature where ID=ISNULL(@TemperatureID,ID)
END
GO
/****** Object:  StoredProcedure [dbo].[GetTasksByName]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTasksByName]
	-- Add the parameters for the stored procedure here
	@Name varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from Tasks where Task like '%' + @Name +'%'
END
GO
/****** Object:  StoredProcedure [dbo].[GetTasks]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTasks]
	-- Add the parameters for the stored procedure here
	@TaskID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Tasks where TaskID=ISNULL(@TaskID,TaskID)
END
GO
/****** Object:  Table [dbo].[PatientAllergies]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PatientAllergies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[Allergy] [varchar](100) NULL,
 CONSTRAINT [PK_PatientAlergies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InterventionTypes]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InterventionTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SiteID] [int] NULL,
	[InterventionType] [varchar](250) NULL,
	[Cost] [decimal](18, 2) NULL,
 CONSTRAINT [PK_InterventionTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InterventionsIntervention]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InterventionsIntervention](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InterventionsID] [int] NOT NULL,
	[Intervention] [varchar](100) NULL,
 CONSTRAINT [PK_InterventionsIntervention] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetWarfarinTrackingPerSiteByDate]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetWarfarinTrackingPerSiteByDate]
	-- Add the parameters for the stored procedure here
	@SiteID int = null,
	@EnteredStartDateTime DATETIME = null,
	@EnteredEndDateTime DATETIME = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT      @EnteredStartDateTime as StartDate, @EnteredEndDateTime as EndDate, WarfarinTracking.DateStarted, WarfarinTracking.PrevAdmitionDate, WarfarinTracking.PreviousHistoryWarfarin, 
						  WarfarinTracking.CounselingCompletedDate, WarfarinTracking.CounselingCompletedUser, WarfarinTracking.EnteredDateTime, 
						  WarfarinTracking.EnteredBy, (Patients.FirstName + ' ' + Patients.LastName) as PatientName
	FROM         WarfarinTracking INNER JOIN
						  Patients ON WarfarinTracking.PatientID = Patients.PatientID
	WHERE     (Patients.SiteID = @SiteID and WarfarinTracking.EnteredDateTime >= @EnteredStartDateTime and WarfarinTracking.EnteredDateTime < DATEADD(DAY,1,@EnteredEndDateTime))
END
GO
/****** Object:  StoredProcedure [dbo].[GetWarfarinTrackingByPatientName]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetWarfarinTrackingByPatientName]
	-- Add the parameters for the stored procedure here
	@PatientName varchar(100) = null,
	@Site int =null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from PatientsView where FullName like '%' + @PatientName + '%' and SiteID = @Site
END
GO
/****** Object:  StoredProcedure [dbo].[GetWarfarinTrackingByPatientID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetWarfarinTrackingByPatientID]
	-- Add the parameters for the stored procedure here
	@PatientID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from WarfarinTracking where PatientID =  @PatientID
END
GO
/****** Object:  StoredProcedure [dbo].[GetInterventionTypesBySite]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetInterventionTypesBySite]	-- Add the parameters for the stored procedure here
	@SiteID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from InterventionTypes where SiteID = @SiteID order by InterventionType 
END
GO
/****** Object:  StoredProcedure [dbo].[GetInterventionTypesByName]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInterventionTypesByName]	-- Add the parameters for the stored procedure here
	@Name varchar(250),
	@SiteID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from InterventionTypes where InterventionType like '%' + @Name + '%' AND SiteID = @SiteID order by InterventionType 
	--SELECT * from InterventionTypes order by InterventionType
END
GO
/****** Object:  StoredProcedure [dbo].[GetInterventionTypes]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInterventionTypes]
	-- Add the parameters for the stored procedure here
	@ID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from InterventionTypes where ID=ISNULL(@ID,ID)
END
GO
/****** Object:  StoredProcedure [dbo].[GetInterventionsPerSiteByDate]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInterventionsPerSiteByDate]
	-- Add the parameters for the stored procedure here
	@SiteID int = null,
	@EnteredStartDateTime DATETIME = null,
	@EnteredEndDateTime DATETIME = null,
	@EnteredBy varchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
if(@EnteredBy is Null or @EnteredBy = 'All')
Begin
	SELECT @EnteredStartDateTime as StartDate, @EnteredEndDateTime as EndDate, Patients.PatientIN, Patients.FirstName + ',' +Patients.LastName as PatientName, Interventions.Physician, CONVERT(INT,Interventions.Minutes) as Minutes, Interventions.EnteredBy, 
                      Interventions.InterventionType, InterventionTypes.Cost, Interventions.EnteredDateTime 
FROM         Patients INNER JOIN
                      Interventions ON Patients.PatientID = Interventions.PatientID
					  INNER JOIN 
					  InterventionTypes ON Interventions.InterventionType = InterventionTypes.InterventionType
WHERE     (Patients.SiteID = @SiteID and Interventions.EnteredDateTime >= @EnteredStartDateTime and Interventions.EnteredDateTime < DATEADD(DAY,1,@EnteredEndDateTime))
End
Else
SELECT @EnteredStartDateTime as StartDate, @EnteredEndDateTime as EndDate, Patients.PatientIN, Patients.FirstName + ',' +Patients.LastName as PatientName, Interventions.Physician, CONVERT(INT,Interventions.Minutes) as Minutes, Interventions.EnteredBy, 
                      Interventions.InterventionType, InterventionTypes.Cost, Interventions.EnteredDateTime 
FROM         Patients INNER JOIN
                      Interventions ON Patients.PatientID = Interventions.PatientID
					  INNER JOIN 
					  InterventionTypes ON Interventions.InterventionType = InterventionTypes.InterventionType
WHERE     (Patients.SiteID = @SiteID and 
		   Interventions.EnteredDateTime >= @EnteredStartDateTime and 
		   Interventions.EnteredDateTime < DATEADD(DAY,1,@EnteredEndDateTime) and
		   Interventions.EnteredBy = @EnteredBy)	
END
GO
/****** Object:  StoredProcedure [dbo].[GetTaskLogDetailsPerSiteByDate]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTaskLogDetailsPerSiteByDate]
	-- Add the parameters for the stored procedure here
	@SiteID int = null,
	@EnteredStartDateTime DATETIME = null,
	@EnteredEndDateTime DATETIME = null
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

-- Insert statements for procedure here
	SELECT     @EnteredStartDateTime as StartDate, @EnteredEndDateTime as EndDate,TaskLog.Equipment, TaskLog.Task, TaskLog.Created, TaskLogDetails.Degree, TaskLogDetails.DueDate, TaskLogDetails.ActionNeeded, 
                           TaskLogDetails.ActionTaken, TaskLogDetails.Status, TaskLogDetails.UserID
     FROM         TaskLog INNER JOIN
                           TaskLogDetails ON TaskLog.TaskID = TaskLogDetails.TaskID
     WHERE     (TaskLog.SiteID = @SiteID and TaskLogDetails.DueDate >= @EnteredStartDateTime and TaskLogDetails.DueDate < DATEADD(DAY,1,@EnteredEndDateTime))
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetTaskLogDetailsByIDByDate]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTaskLogDetailsByIDByDate]
	-- Add the parameters for the stored procedure here
	@TaskID int = null,
	@EnteredStartDateTime DATETIME = null,
	@EnteredEndDateTime DATETIME = null
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

-- Insert statements for procedure here
	SELECT @EnteredStartDateTime as StartDate, @EnteredEndDateTime as EndDate,TaskLogDetails.*, TaskLog.Equipment, TaskLog.Task, Sites.SiteName
	FROM  TaskLogDetails 
	INNER JOIN TaskLog ON TaskLog.TaskID = TaskLogDetails.TaskID
	INNER JOIN SiteS ON TaskLog.SiteID = Sites.ID
    WHERE (TaskLogDetails.TaskID = @TaskID and TaskLogDetails.DueDate >= @EnteredStartDateTime and TaskLogDetails.DueDate < DATEADD(DAY,1,@EnteredEndDateTime))
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetTaskLogDetailsByID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTaskLogDetailsByID]

      -- Add the parameters for the stored procedure here

      @ID int = null

AS

BEGIN

      -- SET NOCOUNT ON added to prevent extra result sets from

      -- interfering with SELECT statements.

      SET NOCOUNT ON;

 

    -- Insert statements for procedure here

      SELECT * from TaskLogDetails  where ID=ISNULL(@ID,ID)

END
GO
/****** Object:  StoredProcedure [dbo].[GetTaskLogDetails]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetTaskLogDetails]

      -- Add the parameters for the stored procedure here

      @TaskID int = null

AS

BEGIN

      -- SET NOCOUNT ON added to prevent extra result sets from

      -- interfering with SELECT statements.

      SET NOCOUNT ON;

 

    -- Insert statements for procedure here

      SELECT * from TaskLogDetails  where TaskID=ISNULL(@TaskID,TaskID)

END
GO
/****** Object:  StoredProcedure [dbo].[GetTaskLogsTracking]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTaskLogsTracking]  
 -- Add the parameters for the stored procedure here  
 @SiteID int,  
 @startDate datetime = null,  
 @endDate datetime = null  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    -- Insert statements for procedure here  
 IF (@startDate is null and @endDate is null)  
 BEGIN
	IF (@SiteID = 0)
	BEGIN
		SELECT * from TaskLogsTracking order by id desc
	END
	ELSE
	BEGIN
		SELECT * from TaskLogsTracking WHERE SiteID = @SiteID order by id desc
	END   
 END   
 ELSE  
 BEGIN
	IF (@SiteID = 0)
	BEGIN
		SELECT * from TaskLogsTracking   
		WHERE     (DueDate >= @startDate and DueDate < DATEADD(DAY,1,@endDate))  
		order by id desc
	END
	ELSE
	BEGIN
		SELECT * from TaskLogsTracking   
		WHERE     (SiteID = @SiteID and DueDate >= @startDate and DueDate < DATEADD(DAY,1,@endDate))  
		order by id desc
	END  
 END   
END
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticsCostSavingsDaysTherapy]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetAntibioticsCostSavingsDaysTherapy]
	-- Add the parameters for the stored procedure here
	@SiteID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from AntibioticsCostSavingsDaysTherapy where SiteID = @SiteID
END
GO
/****** Object:  StoredProcedure [dbo].[GetCompoundedDrugDetailsByID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCompoundedDrugDetailsByID]
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from CompoundedDrugsDetails where ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetCompoundedDrugDetails]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetCompoundedDrugDetails]
	-- Add the parameters for the stored procedure here
	
	@CompoundedDrugID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from CompoundedDrugsDetails where CompoundedDrugID=@CompoundedDrugID 
END
GO
/****** Object:  StoredProcedure [dbo].[GetPatient]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPatient]
	-- Add the parameters for the stored procedure here
	@PatientID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from patients where PatientID=@PatientID 
	Select * from patientAllergies where PatientID=@PatientID
	Select * from Interventions where PatientID=@PatientID 
END
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticTrackingByPatientName]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetAntibioticTrackingByPatientName]
	-- Add the parameters for the stored procedure here
	@PatientName varchar(100) = null,
	@Site int =null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from PatientsView where FullName like '%' + @PatientName + '%' and SiteID = @Site
END
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticTrackingByPatientID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetAntibioticTrackingByPatientID]
	-- Add the parameters for the stored procedure here
	@PatientID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from AntibioticTracking where PatientID=@PatientID
END
GO
/****** Object:  StoredProcedure [dbo].[GetInterventionsByPatientName]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetInterventionsByPatientName]
	-- Add the parameters for the stored procedure here
	@PatientName varchar(100) = null,
	@Site int =null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from PatientsView where FullName like '%' + @PatientName + '%' and SiteID = @Site
END
GO
/****** Object:  StoredProcedure [dbo].[GetInterventionsByPatientID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInterventionsByPatientID]
	-- Add the parameters for the stored procedure here
	@PatientID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Interventions where PatientID=ISNULL(@PatientID,PatientID)
END
GO
/****** Object:  Table [dbo].[AntibioticsCostSavingsTracking]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AntibioticsCostSavingsTracking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AntibioticTrackingID] [int] NULL,
	[DateEntered] [datetime] NULL,
	[AntibioticDrug1] [int] NULL,
	[AntibioticDrug1Frequency] [int] NULL,
	[AntibioticDrug1Physician] [int] NULL,
	[AntibioticDrug2] [int] NULL,
	[AntibioticDrug2Frequency] [int] NULL,
	[AntibioticDrug2Physician] [int] NULL,
	[CostSavings] [decimal](18, 2) NULL,
	[DateUpdated] [datetime] NULL,
	[EnteredBy] [varchar](50) NULL,
	[UpdatedBy] [varchar](50) NULL,
	[Recommended] [bit] NULL,
	[Accepted] [bit] NULL,
 CONSTRAINT [PK_AntibioticsCostSavingsTracking] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AntibioticAntibioticPrescribed]    Script Date: 01/01/2015 22:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AntibioticAntibioticPrescribed](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AntibioticTrackingID] [int] NULL,
	[AntibioticPrescribedName] [varchar](100) NULL,
	[Dose] [varchar](100) NULL,
	[Frequency] [varchar](100) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_AntibioticAntibioticPrescribed] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AntibioticAntibioticIndication]    Script Date: 01/01/2015 22:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AntibioticAntibioticIndication](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AntibioticTrackingID] [int] NOT NULL,
	[AntibioticIndicationName] [varchar](100) NULL,
 CONSTRAINT [PK_AntibioticAntibioticIndication] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[AddPatientAllergies]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddPatientAllergies]
	-- Add the parameters for the stored procedure here
	@PatientID int,
	@Allergy varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if (select COUNT (*) from PatientAllergies where PatientID=@PatientID AND Allergy=@Allergy) = 0 
	begin
		Insert into PatientAllergies (PatientID,Allergy) values (@PatientID,@Allergy )
	end
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAntibioticsCostSavingsDaysTherapy]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AddUpdateAntibioticsCostSavingsDaysTherapy]
	-- Add the parameters for the stored procedure here
	    @SiteID int,
	    @Description varchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if (select COUNT (*) from AntibioticsCostSavingsDaysTherapy where SiteID=@SiteID) = 0 
    BEGIN	
		INSERT INTO [AntibioticsCostSavingsDaysTherapy]
           ([SiteID]
           ,[Description])
		VALUES
           (@SiteID
           ,@Description)
	END
	ELSE
	BEGIN
		UPDATE [AntibioticsCostSavingsDaysTherapy]
		SET [Description] = @Description
		WHERE SiteID=@SiteID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAntibioticTracking]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateAntibioticTracking]
	-- Add the parameters for the stored procedure here
	    @AntibioticTrackingID int = null,
		@PatientID int = null,
        @MedHistory text = null,
        @OtherInfo text = null,
		@EnteredBy varchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if @AntibioticTrackingID is null
    BEGIN	
		INSERT INTO [AntibioticTracking]
           ([PatientID]
           ,[MedHistory]
           ,[OtherInfo]
		   ,[EnteredBy])
		VALUES
           (@PatientID
           ,@MedHistory
           ,@OtherInfo
		   ,@EnteredBy)

		   SELECT SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		UPDATE [AntibioticTracking]
	   SET [MedHistory] = @MedHistory
		  ,[OtherInfo] = @OtherInfo
		 WHERE AntibioticTrackingID=@AntibioticTrackingID

		 SELECT SCOPE_IDENTITY()
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateInterventionTypes]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateInterventionTypes]
	-- Add the parameters for the stored procedure here
	@ID int = NULL,
	@InterventionType varchar(250),
	@Cost Decimal,
	@SiteID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @ID is NULL
	BEGIN
		INSERT INTO InterventionTypes (SiteID,InterventionType,Cost) values(@SiteID,@InterventionType,@Cost)
		Select @@IDENTITY 
	END
	ELSE
	BEGIN
		Update InterventionTypes SET InterventionType=@InterventionType,Cost=@Cost 
		where ID=@ID
		Select @ID
	
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateInterventions]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateInterventions]
	-- Add the parameters for the stored procedure here
	    @InterventionsID int = null,
		@InterventionType VARCHAR(250) = null,
		@PatientID int = null,
        @Physician varchar(100) = null,
        @Minutes varchar(50) = null,
		@EnteredBy varchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if @InterventionsID is null
    BEGIN	
		INSERT INTO [Interventions]
           ([PatientID]
           ,[Physician]
           ,[Minutes]
		   ,[EnteredBy]
		   ,[InterventionType])
		VALUES
           (@PatientID
           ,@Physician
           ,@Minutes
		   ,@EnteredBy
		   ,@InterventionType)

		   SELECT SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		UPDATE [Interventions]
		SET [Physician] = @Physician
		  ,[Minutes] = @Minutes
		  ,[InterventionType] = @InterventionType
		 WHERE InterventionsID=@InterventionsID

		SELECT SCOPE_IDENTITY()
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateCompoundedDrugsDetails]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateCompoundedDrugsDetails]
	-- Add the parameters for the stored procedure here
	@ID int = null,
	@CompoundedDrugID int,
    @Additive varchar(150),
    @Strength varchar(50),
    @Concentration varchar(50),
    @Form varchar(50),
    @Size varchar(50),
    @Lot_Number varchar(50),
    @Mfg_expiry_date datetime,
    @Drug_Manufacturer varchar(50),
    @Qty varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @ID is null
	BEGIN
		INSERT INTO [CompoundedDrugsDetails]
           ([CompoundedDrugID]
           ,[Additive]
           ,[Strength]
           ,[Concentration]
           ,[form]
           ,[size]
           ,[Lot_Number]
           ,[Mfg_expiry_date]
           ,[Drug_Manufacturer]
           ,[Qty])
     VALUES
           (@CompoundedDrugID
           ,@Additive
           ,@Strength
           ,@Concentration
           ,@Form
           ,@Size
           ,@Lot_Number
           ,@Mfg_expiry_date
           ,@Drug_Manufacturer
           ,@Qty)

	END
	ELSE
	BEGIN
		UPDATE [CompoundedDrugsDetails]
		SET 
		[Additive] = @Additive
      ,[Strength] = @Strength
      ,[Concentration] = @Concentration
      ,[form] = @Form
      ,[size] = @Size
      ,[Lot_Number] = @Lot_Number
      ,[Mfg_expiry_date] = @Mfg_expiry_date
      ,[Drug_Manufacturer] = @Drug_Manufacturer
      ,[Qty] = @Qty
		WHERE ID=@ID 


	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateTaskLogsTracking]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateTaskLogsTracking]  
 -- Add the parameters for the stored procedure here  
  @id int = null,  
  @SiteID int = null,  
  @TaskDescription varchar(250) = null,  
  @Status varchar(50) = null,  
        @DueDate datetime = null,  
  @DueTime varchar(50) = null,  
        @AssignedTo varchar(150) = null,  
  @IsRequrring bit = null,  
  @Frequency varchar(150) = null,  
  @WeeklyFrequency varchar(150) = null,  
  @MonthlyFrequency varchar(150) = null,  
  @EmailFrequency varchar(250) = null,  
  @Comments text = null,  
  @EnteredDateTime datetime = null,  
  @EnteredBy varchar(50) = null,  
  @CompletedDateTime datetime = null,  
  @CompletedBy varchar(50) = null,  
  @UpdatedDateTime datetime = null,  
  @UpdatedBy varchar(50) = null  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    -- Insert statements for procedure here  
    if @id is null  
    BEGIN   
  INSERT INTO [TaskLogsTracking]  
           (SiteID  
     ,TaskDescription  
     ,Status  
     ,DueDate  
     ,DueTime  
     ,AssignedTo  
     ,IsRequrring  
     ,Frequency  
     ,WeeklyFrequency  
     ,MonthlyFrequency  
     ,EmailFrequency  
     ,Comments  
     ,EnteredDateTime  
     ,EnteredBy)  
  VALUES  
           (@SiteID  
     ,@TaskDescription  
     ,@Status  
     ,@DueDate  
     ,@DueTime  
     ,@AssignedTo  
     ,@IsRequrring  
     ,@Frequency  
     ,@WeeklyFrequency  
     ,@MonthlyFrequency  
     ,@EmailFrequency  
     ,@Comments  
     ,@EnteredDateTime  
     ,@EnteredBy)  
  
     SELECT SCOPE_IDENTITY()  
 END  
 ELSE  
 BEGIN  
  UPDATE [TaskLogsTracking]  
    SET [TaskDescription] = @TaskDescription
     ,[SiteID] = @SiteID     
     ,[Status] = @Status  
     ,[DueDate] = @DueDate  
     ,[DueTime] = @DueTime  
     ,[AssignedTo] = @AssignedTo  
     ,[IsRequrring] = @IsRequrring  
     ,[Frequency] = @Frequency  
     ,[WeeklyFrequency] = @WeeklyFrequency  
     ,[MonthlyFrequency] = @MonthlyFrequency  
     ,[EmailFrequency] = @EmailFrequency  
     ,[Comments] = @Comments  
     ,[CompletedDateTime] = @CompletedDateTime  
     ,[CompletedBy] = @CompletedBy  
     ,[UpdatedDateTime] = @UpdatedDateTime  
     ,[UpdatedBy] = @UpdatedBy  
   WHERE id=@id  
  
  SELECT SCOPE_IDENTITY()  
 END  
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateTaskLogDetails]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateTaskLogDetails]
	-- Add the parameters for the stored procedure here
	@ID int = null,
	@TaskID int,
	@Degree varchar(50) = null,
	@DueDate datetime,
	@ActionNeeded varchar(250)= null,
	@ActionTaken varchar(max)=null,
	@Status varchar(50),
	@UserID varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @ID is null
	begin
		insert into TaskLogDetails
		(taskid,degree,duedate,actionneeded,actiontaken,status,userid)
		values(@TaskID,@Degree,@DueDate,@ActionNeeded,@ActionTaken,@Status,@UserID )
	end
	else
	begin
		update TaskLogDetails
		set taskid=@TaskID ,degree=@Degree ,DueDate=@DueDate ,ActionNeeded=@ActionNeeded ,ActionTaken =@ActionTaken ,Status=@Status ,UserID =@UserID 
		where ID=@ID
	end
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateWarfarinTracking]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateWarfarinTracking]
	-- Add the parameters for the stored procedure here
		@WarfarinTrackingID int = null,
		@PatientID int = null,
        @DateStarted datetime = null,
        @PrevAdmitionDate datetime = null,
        @PreviousHistoryWarfarin text = null,
        @CounselingCompletedDate datetime = null,
        @CounselingCompletedUser varchar(150) = null,
		@EnteredBy varchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if @WarfarinTrackingID is null
    BEGIN	
		INSERT INTO [WarfarinTracking]
           (PatientID
			,DateStarted
			,PrevAdmitionDate
			,PreviousHistoryWarfarin
			,CounselingCompletedDate
			,CounselingCompletedUser
			,EnteredBy)
		VALUES
           (@PatientID
			,@DateStarted
			,@PrevAdmitionDate
			,@PreviousHistoryWarfarin
			,@CounselingCompletedDate
			,@CounselingCompletedUser
			,@EnteredBy)

		   SELECT SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		UPDATE [WarfarinTracking]
	   SET [DateStarted] = @DateStarted
		  ,[PrevAdmitionDate] = @PrevAdmitionDate
		  ,[PreviousHistoryWarfarin] = @PreviousHistoryWarfarin
		  ,[CounselingCompletedDate] = @CounselingCompletedDate
		  ,[CounselingCompletedUser] = @CounselingCompletedUser
		 WHERE WarfarinTrackingID=@WarfarinTrackingID

		SELECT SCOPE_IDENTITY()
	END
END
GO
/****** Object:  Table [dbo].[AntibioticStewardshipChecklist]    Script Date: 01/01/2015 22:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AntibioticStewardshipChecklist](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AntibioticTrackingID] [int] NULL,
	[Cultures] [varchar](50) NULL,
	[CulturesDate] [datetime] NULL,
	[AntibioticsAppropriate] [varchar](50) NULL,
	[AntibioticsAppropriateComments] [text] NULL,
	[OralAntibiotics] [varchar](50) NULL,
	[OralAntibioticsComments] [text] NULL,
	[OtherInformation] [text] NULL,
 CONSTRAINT [PK_AntibioticStewardshipChecklist] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AntibioticLabs]    Script Date: 01/01/2015 22:24:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AntibioticLabs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AntibioticTrackingID] [int] NULL,
	[LabDate] [datetime] NOT NULL CONSTRAINT [DF_AntibioticLabs]  DEFAULT (getdate()),
	[WBC] [int] NULL,
	[HGB] [int] NULL,
	[HCT] [int] NULL,
	[PLT] [int] NULL,
	[Na] [int] NULL,
	[Cl] [int] NULL,
	[K] [int] NULL,
	[CO2] [int] NULL,
	[BUN] [int] NULL,
	[SRCR] [decimal](18, 2) NULL,
	[Glucose] [int] NULL,
	[CRCL] [decimal](18, 5) NULL,
	[EnteredBy] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[CheckInterventionTypesByName]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[CheckInterventionTypesByName]	-- Add the parameters for the stored procedure here
	@Name varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from InterventionTypes where InterventionType = @Name 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCompoundedDrugsDetails]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCompoundedDrugsDetails]
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from CompoundedDrugsDetails where ID=@ID 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteTaskLogsTracking]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DeleteTaskLogsTracking]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from TaskLogsTracking where id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteInterventions]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DeleteInterventions]
	-- Add the parameters for the stored procedure here
	@InterventionsID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	delete from Interventions where InterventionsID=@InterventionsID 
	
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteTaskLogDetail]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteTaskLogDetail]

      -- Add the parameters for the stored procedure here

      @ID int

AS

BEGIN

      -- SET NOCOUNT ON added to prevent extra result sets from

      -- interfering with SELECT statements.

      SET NOCOUNT ON;

 

    -- Insert statements for procedure here

      Delete from TaskLogDetails where ID=@ID

END
GO
/****** Object:  StoredProcedure [dbo].[DeletePatientAllergies]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DeletePatientAllergies]
	-- Add the parameters for the stored procedure here
	@PatientID int,
	@Allergy varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	delete from PatientAllergies where PatientID=@PatientID AND Allergy=@Allergy
	
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteInterventionTypes]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DeleteInterventionTypes]
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from InterventionTypes where ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[SendTaskLogTrackingEmail]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SendTaskLogTrackingEmail]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

declare @t varchar(50)
declare @tmpdate datetime
declare @tmpdate2 datetime
declare @tmpdate3 datetime
declare @tmpd7 datetime



set @t= convert(varchar, getdate(), 101) + ' 23:59:59';
Set @tmpdate=convert(datetime,@t)


set @tmpdate2= DATEadd(D,-7,Getdate())
set @tmpd7 = convert(datetime,@t)
set @tmpdate3=  DATEADD(D,1, GETDATE())


--select @tmpdate 
    -- Insert statements for procedure here
SELECT     id, SiteID, TaskDescription, Status, DueDate, DueTime, AssignedTo, IsRequrring, Frequency, WeeklyFrequency, MonthlyFrequency, EmailFrequency, Comments, 
                      EnteredDateTime, EnteredBy
FROM         TaskLogsTracking
WHERE     (DueDate <= @tmpdate) AND (Status = 'Pending') --and isRequrring = 0


SELECT     id, SiteID, TaskDescription, Status, DueDate, DueTime, AssignedTo, IsRequrring, Frequency, WeeklyFrequency, MonthlyFrequency, EmailFrequency, Comments, 
                      EnteredDateTime, EnteredBy,0
FROM         TaskLogsTracking
WHERE  convert(varchar, DueDate, 101)    =convert(varchar, @tmpdate3,101)  AND (Status = 'Pending')  and 
EmailFrequency = '0'


union all
SELECT     id, SiteID, TaskDescription, Status, DueDate, DueTime, AssignedTo, IsRequrring, Frequency, WeeklyFrequency, MonthlyFrequency, EmailFrequency, Comments, 
                      EnteredDateTime, EnteredBy,0
FROM         TaskLogsTracking
WHERE    convert(varchar, DueDate, 101)    = convert(varchar,getdate()) AND (Status = 'Pending') and isRequrring = 1 and 
EmailFrequency = '1'



union all

SELECT     id, SiteID, TaskDescription, Status, DueDate, DueTime, AssignedTo, IsRequrring, Frequency, WeeklyFrequency, MonthlyFrequency, EmailFrequency, Comments, 
                      EnteredDateTime, EnteredBy,0
FROM         TaskLogsTracking
WHERE     DATEDIFF (D,GETDATE(),DueDate ) < 8 AND (Status = 'Pending') and 
EmailFrequency = '2'

END
GO
/****** Object:  Table [dbo].[TaskLogsTrackingEmail]    Script Date: 01/01/2015 22:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskLogsTrackingEmail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TaskLogsTrackingId] [int] NULL,
	[Email] [varchar](250) NULL,
 CONSTRAINT [PK_TaskLogsTrackingEmail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[TempGetAppID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TempGetAppID]
    @appName    tAppName,
    @appId      int OUTPUT
    AS
    SET @appName = LOWER(@appName)
    SET @appId = NULL

    SELECT @appId = AppId
    FROM [pharmabase].dbo.pharmabaseTempApplications
    WHERE AppName = @appName

    IF @appId IS NULL BEGIN
        BEGIN TRAN        

        SELECT @appId = AppId
        FROM [pharmabase].dbo.pharmabaseTempApplications WITH (TABLOCKX)
        WHERE AppName = @appName
        
        IF @appId IS NULL
        BEGIN
            EXEC GetHashCode @appName, @appId OUTPUT
            
            INSERT [pharmabase].dbo.pharmabaseTempApplications
            VALUES
            (@appId, @appName)
            
            IF @@ERROR = 2627 
            BEGIN
                DECLARE @dupApp tAppName
            
                SELECT @dupApp = RTRIM(AppName)
                FROM [pharmabase].dbo.pharmabaseTempApplications 
                WHERE AppId = @appId
                
                RAISERROR('SQL session state fatal error: hash-code collision between applications ''%s'' and ''%s''. Please rename the 1st application to resolve the problem.', 
                            18, 1, @appName, @dupApp)
            END
        END

        COMMIT
    END

    RETURN 0
GO
/****** Object:  Table [dbo].[WarfarinLabs]    Script Date: 01/01/2015 22:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WarfarinLabs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WarfarinTrackingID] [int] NOT NULL,
	[LabDate] [datetime] NOT NULL CONSTRAINT [DF_WarfarinLabs]  DEFAULT (getdate()),
	[hemoglobin] [varchar](50) NULL,
	[hematocrit] [varchar](50) NULL,
	[platelets] [varchar](50) NULL,
	[inr] [varchar](50) NULL,
	[WarfarinDose] [varchar](50) NULL,
	[EnteredBy] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WarfarinIndication]    Script Date: 01/01/2015 22:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarfarinIndication](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WarfarinTrackingID] [int] NULL,
	[WarfarinIndicationText] [text] NULL,
	[Anticoagulation] [text] NULL,
	[WarfarinPastMedicalHistory] [text] NULL,
	[CurrentMedications] [text] NULL,
	[MedicationsInteractWarfarin] [text] NULL,
	[DrugsEffect] [text] NULL,
 CONSTRAINT [PK_WarfarinIndication] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetWarfarinIndicationPerSiteByDate]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetWarfarinIndicationPerSiteByDate]
	-- Add the parameters for the stored procedure here
	@SiteID int = null,
	@EnteredStartDateTime DATETIME = null,
	@EnteredEndDateTime DATETIME = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     @EnteredStartDateTime AS StartDate, @EnteredEndDateTime AS EndDate, WarfarinTracking.EnteredDateTime, WarfarinTracking.EnteredBy, 
	                      Patients.FirstName + ' ' + Patients.LastName AS PatientName, WarfarinIndication.WarfarinIndicationText, WarfarinIndication.Anticoagulation, 
	                      WarfarinIndication.WarfarinPastMedicalHistory, WarfarinIndication.CurrentMedications, WarfarinIndication.MedicationsInteractWarfarin, 
	                      WarfarinIndication.DrugsEffect
	FROM         WarfarinTracking INNER JOIN
	                      Patients ON WarfarinTracking.PatientID = Patients.PatientID INNER JOIN
	                      WarfarinIndication ON WarfarinTracking.WarfarinTrackingID = WarfarinIndication.WarfarinTrackingID
	WHERE     (Patients.SiteID = @SiteID) AND (WarfarinTracking.EnteredDateTime >= @EnteredStartDateTime) AND 
	                      (WarfarinTracking.EnteredDateTime < DATEADD(DAY, 1, @EnteredEndDateTime))
END
GO
/****** Object:  StoredProcedure [dbo].[GetWarfarinIndicationByWarfarinTrackingID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetWarfarinIndicationByWarfarinTrackingID]
	-- Add the parameters for the stored procedure here
	@WarfarinTrackingID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from WarfarinIndication where WarfarinTrackingID=@WarfarinTrackingID
END
GO
/****** Object:  Table [dbo].[WarfarinWarfarinInrGoal]    Script Date: 01/01/2015 22:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WarfarinWarfarinInrGoal](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WarfarinIndicationID] [int] NULL,
	[WarfarinInrGoal] [varchar](50) NULL,
 CONSTRAINT [PK_WarfarinWarfarinInrGoal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[UpdateAntibioticsCostSavingsTrackingRecommendedAcceptedByID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[UpdateAntibioticsCostSavingsTrackingRecommendedAcceptedByID]
	-- Add the parameters for the stored procedure here
	    @id int,
		@Recommended bit,
		@Accepted bit,
		@UpdatedBy varchar (50),
		@DateUpdated datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    
	-- Insert statements for procedure here
    UPDATE [AntibioticsCostSavingsTracking]
		SET [Recommended] = @Recommended
		  ,[Accepted] = @Accepted
		  ,[UpdatedBy] = @UpdatedBy
		  ,[DateUpdated] = @DateUpdated
		 WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteInterventionsIntervention]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DeleteInterventionsIntervention]
	-- Add the parameters for the stored procedure here
	@InterventionsID int,
	@Intervention varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	delete from InterventionsIntervention where InterventionsID=@InterventionsID AND Intervention=@Intervention
	
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAntibioticAntibioticPrescribed]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAntibioticAntibioticPrescribed]
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from AntibioticAntibioticPrescribed where ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAntibioticAntibioticIndication]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAntibioticAntibioticIndication]
	-- Add the parameters for the stored procedure here
	@AntibioticTrackingID int = null,
	@AntibioticIndicationName varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from AntibioticAntibioticIndication where AntibioticTrackingID=@AntibioticTrackingID
		and AntibioticIndicationName = @AntibioticIndicationName
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAntibioticsCostSavingsTrackingByID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DeleteAntibioticsCostSavingsTrackingByID]
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from AntibioticsCostSavingsTracking where id=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAntibioticLab]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAntibioticLab]
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from AntibioticLabs where ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateWarfarinLab]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateWarfarinLab]
	-- Add the parameters for the stored procedure here
	    @ID int = null,
		@WarfarinTrackingID int = null,
        --@LabDate datetime = null,
        @hemoglobin varchar(50) = null,
        @hematocrit varchar(50) = null,
        @platelets varchar(50) = null,
        @inr varchar(50) = null,
        @WarfarinDose varchar(50) = null,
		@EnteredBy varchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

    -- Insert statements for procedure here
      IF @ID IS NULL
      BEGIN
            INSERT INTO WarfarinLabs
			(WarfarinTrackingID
			--,LabDate
			,hemoglobin
			,hematocrit
			,platelets
			,inr
			,WarfarinDose
			,EnteredBy) 
			values 
			(@WarfarinTrackingID
			--,@LabDate
			,@hemoglobin
			,@hematocrit
			,@platelets
			,@inr
			,@WarfarinDose
			,@EnteredBy)
            Select @@IDENTITY
      END
      ELSE
      BEGIN
            UPDATE WarfarinLabs SET 
			--LabDate=@LabDate
			hemoglobin=@hemoglobin
			,hematocrit=@hematocrit
			,platelets=@platelets
			,inr=@inr
			,WarfarinDose=@WarfarinDose
			WHERE ID=@ID
      END
    
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateWarfarinIndication]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateWarfarinIndication]
	-- Add the parameters for the stored procedure here
	    @ID int = null,
		@WarfarinTrackingID int = null,
        @WarfarinIndicationText text = null,
        @Anticoagulation text = null,
        @WarfarinPastMedicalHistory Text = null,
        @CurrentMedications text = null,
        @MedicationsInteractWarfarin text = null,
		@DrugsEffect text = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if @ID is null
    BEGIN	
		INSERT INTO [WarfarinIndication]
           (WarfarinTrackingID
			,WarfarinIndicationText
			,Anticoagulation
			,WarfarinPastMedicalHistory
			,CurrentMedications
			,MedicationsInteractWarfarin
			,DrugsEffect)
		VALUES
           (@WarfarinTrackingID
			,@WarfarinIndicationText
			,@Anticoagulation
			,@WarfarinPastMedicalHistory
			,@CurrentMedications
			,@MedicationsInteractWarfarin
			,@DrugsEffect)


		   SELECT SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		UPDATE [WarfarinIndication]
	   SET [WarfarinIndicationText] = @WarfarinIndicationText
		  ,[Anticoagulation] = @Anticoagulation
		  ,[WarfarinPastMedicalHistory] = @WarfarinPastMedicalHistory
		  ,[CurrentMedications] = @CurrentMedications
		  ,[MedicationsInteractWarfarin] = @MedicationsInteractWarfarin
		  ,[DrugsEffect] = @DrugsEffect
		 WHERE ID=@ID
		 SELECT SCOPE_IDENTITY()
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAntibioticStewardshipChecklist]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateAntibioticStewardshipChecklist]
	-- Add the parameters for the stored procedure here
	    @ID int = null,
		@AntibioticTrackingID int = null,
		@Cultures varchar(50) = null,
        @CulturesDate datetime = null,
        @AntibioticsAppropriate varchar(50) = null,
		@AntibioticsAppropriateComments text = null,
		@OralAntibiotics varchar(50) = null,
		@OralAntibioticsComments text = null,
		@OtherInformation text = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if @ID is null
    BEGIN	
		INSERT INTO [AntibioticStewardshipChecklist]
           ([AntibioticTrackingID]
           ,[Cultures]
           ,[CulturesDate]
		   ,[AntibioticsAppropriate]
		   ,[AntibioticsAppropriateComments]
		   ,[OralAntibiotics]
		   ,[OralAntibioticsComments]
		   ,[OtherInformation])
		VALUES
           (@AntibioticTrackingID
           ,@Cultures
           ,@CulturesDate
		   ,@AntibioticsAppropriate
		   ,@AntibioticsAppropriateComments
		   ,@OralAntibiotics
		   ,@OralAntibioticsComments
		   ,@OtherInformation)

		   SELECT SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		UPDATE [AntibioticStewardshipChecklist]
	   SET [Cultures] = @Cultures
		  ,[CulturesDate] = @CulturesDate
		  ,[AntibioticsAppropriate] = @AntibioticsAppropriate
		  ,[AntibioticsAppropriateComments] = @AntibioticsAppropriateComments
		  ,[OralAntibiotics] = @OralAntibiotics
		  ,[OralAntibioticsComments] = @OralAntibioticsComments
		  ,[OtherInformation] = @OtherInformation
		 WHERE ID=@ID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAntibioticsCostSavingsTracking]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateAntibioticsCostSavingsTracking]
	-- Add the parameters for the stored procedure here
	    @id int = null,
		@AntibioticTrackingID int = null,
		@AntibioticDrug1 int = null,
		@AntibioticDrug1Frequency int = null,
		@AntibioticDrug1Physician int = null,
		@AntibioticDrug2 int = null,
		@AntibioticDrug2Frequency int = null,
		@AntibioticDrug2Physician int = null,
		@DateEntered datetime = null,
		@CostSavings decimal(18,2) = null,
		@DateUpdated datetime = null,
		@EnteredBy varchar(50) = null,
		@Recommended bit = False,
		@Accepted bit = False
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if @id is null
    BEGIN	
		INSERT INTO [AntibioticsCostSavingsTracking]
           ([AntibioticTrackingID]
           ,[DateEntered]
           ,[AntibioticDrug1]
		   ,[AntibioticDrug1Frequency]
		   ,[AntibioticDrug1Physician]
		   ,[AntibioticDrug2]
		   ,[AntibioticDrug2Frequency]
		   ,[AntibioticDrug2Physician]
		   ,[CostSavings]
		   ,[EnteredBy]
		   ,[Recommended]
		   ,[Accepted])
		VALUES
           (@AntibioticTrackingID
           ,@DateEntered
           ,@AntibioticDrug1
		   ,@AntibioticDrug1Frequency
		   ,@AntibioticDrug1Physician
		   ,@AntibioticDrug2
		   ,@AntibioticDrug2Frequency
		   ,@AntibioticDrug2Physician
		   ,@CostSavings
		   ,@EnteredBy
		   ,@Recommended
		   ,@Accepted)
	END
	ELSE
	BEGIN
		UPDATE [AntibioticsCostSavingsTracking]
		SET [AntibioticDrug1] = @AntibioticDrug1
		  ,[AntibioticDrug1Frequency] = @AntibioticDrug1Frequency
		  ,[AntibioticDrug1Physician] = @AntibioticDrug1Physician
		  ,[AntibioticDrug2] = @AntibioticDrug2
		  ,[AntibioticDrug2Frequency] = @AntibioticDrug2Frequency
		  ,[AntibioticDrug2Physician] = @AntibioticDrug2Physician
		  ,[CostSavings] = @CostSavings
		  ,[DateUpdated] = @DateUpdated
		  ,[EnteredBy] = @EnteredBy
		 WHERE id=@id
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAntibioticLab]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateAntibioticLab]
	-- Add the parameters for the stored procedure here
	    @ID int = null,
		@AntibioticTrackingID int = null,
        --@LabDate datetime = null,
        @WBC int = null,
        @HGB int = null,
        @HCT int = null,
        @PLT int = null,
        @Na int = null,
        @Cl int = null,
        @K int = null,
        @CO2 int = null,
        @BUN int = null,
        @SRCR decimal(18,2) = null,
        @Glucose int = null,
        @CRCL decimal(18,2) = null,
		@EnteredBy varchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

    -- Insert statements for procedure here
      IF @ID IS NULL
      BEGIN
            INSERT INTO AntibioticLabs 
			(AntibioticTrackingID
			--,LabDate
			,WBC
			,HGB
			,HCT
			,PLT
			,Na
			,Cl
			,K
			,CO2
			,BUN
			,SRCR
			,Glucose
			,CRCL
			,EnteredBy) 
			values 
			(@AntibioticTrackingID
			--,@LabDate
			,@WBC
			,@HGB
			,@HCT
			,@PLT
			,@Na
			,@Cl
			,@K
			,@CO2
			,@BUN
			,@SRCR
			,@Glucose
			,@CRCL
			,@EnteredBy)
            Select @@IDENTITY
      END
      ELSE
      BEGIN
            UPDATE AntibioticLabs SET 
			--LabDate=@LabDate
			WBC=@WBC
			,HGB=@HGB
			,HCT=@HCT
			,PLT=@PLT
			,Na=@Na
			,Cl=@Cl
			,K=@K
			,CO2=@CO2
			,BUN=@BUN
			,SRCR=@SRCR
			,Glucose=@Glucose
			,CRCL=@CRCL
			WHERE ID=@ID
      END
    
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAntibioticAntibioticPrescribed]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateAntibioticAntibioticPrescribed]
	-- Add the parameters for the stored procedure here
	    @ID int = null,
		@AntibioticTrackingID int = null,
		@AntibioticPrescribedName varchar(100) = null,
        @Dose varchar(100) = null,
        @Frequency varchar(100) = null,
		@StartDate datetime = null,
		@EndDate datetime = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if @ID is null
    BEGIN
		if (select COUNT (*) from AntibioticAntibioticPrescribed where 
			AntibioticTrackingID=@AntibioticTrackingID 
			AND AntibioticPrescribedName=@AntibioticPrescribedName
			AND Dose=@Dose
			AND Frequency=@Frequency
			AND StartDate=@StartDate
			AND EndDate=@EndDate) = 0 
		begin
			INSERT INTO [AntibioticAntibioticPrescribed]
			   ([AntibioticTrackingID]
			   ,[AntibioticPrescribedName]
			   ,[Dose]
			   ,[Frequency]
			   ,[StartDate]
			   ,[EndDate])
			VALUES
			   (@AntibioticTrackingID
			   ,@AntibioticPrescribedName
			   ,@Dose
			   ,@Frequency
			   ,@StartDate
			   ,@EndDate)

			SELECT SCOPE_IDENTITY()
		END
	END
	ELSE
	BEGIN
		UPDATE [AntibioticAntibioticPrescribed]
	   SET [AntibioticPrescribedName] = @AntibioticPrescribedName
		  ,[Dose] = @Dose
		  ,[Frequency] = @Frequency
		  ,[StartDate] = @StartDate
		  ,[EndDate] = @EndDate
		 WHERE ID=@ID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateAntibioticAntibioticIndication]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateAntibioticAntibioticIndication]
	-- Add the parameters for the stored procedure here
	    @ID int = null,
		@AntibioticTrackingID int = null,
		@AntibioticIndicationName varchar(100) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    if @ID is null
    BEGIN
	
		if (select COUNT (*) from AntibioticAntibioticIndication where AntibioticTrackingID=@AntibioticTrackingID AND AntibioticIndicationName=@AntibioticIndicationName) = 0 
		begin
			INSERT INTO AntibioticAntibioticIndication  (AntibioticTrackingID,AntibioticIndicationName) values (@AntibioticTrackingID,@AntibioticIndicationName)

			SELECT SCOPE_IDENTITY()
		end
	END
	ELSE
	BEGIN
		UPDATE [AntibioticAntibioticIndication]
	   SET [AntibioticIndicationName] = @AntibioticIndicationName
		 WHERE ID=@ID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddTaskLogsTrackingEmail]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AddTaskLogsTrackingEmail]
	-- Add the parameters for the stored procedure here
	@TaskLogsTrackingId int,
	@Email varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if (select COUNT (*) from TaskLogsTrackingEmail where TaskLogsTrackingId=@TaskLogsTrackingId AND Email=@Email) = 0 
	begin
		Insert into TaskLogsTrackingEmail (TaskLogsTrackingId,Email) values (@TaskLogsTrackingId,@Email)
	end
END
GO
/****** Object:  StoredProcedure [dbo].[AddInterventionsIntervention]    Script Date: 01/01/2015 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddInterventionsIntervention]
	-- Add the parameters for the stored procedure here
	@InterventionsID int,
	@Intervention varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if (select COUNT (*) from InterventionsIntervention where InterventionsID=@InterventionsID AND Intervention=@Intervention) = 0 
	begin
		Insert into InterventionsIntervention (InterventionsID,Intervention) values (@InterventionsID,@Intervention )
	end
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteTaskLogsTrackingEmail]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DeleteTaskLogsTrackingEmail]
	-- Add the parameters for the stored procedure here
	@TaskLogsTrackingId int,
	@Email varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	delete from TaskLogsTrackingEmail where TaskLogsTrackingId=@TaskLogsTrackingId AND Email=@Email
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticStewardshipChecklist]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetAntibioticStewardshipChecklist]
	-- Add the parameters for the stored procedure here
	@AntibioticTrackingID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from AntibioticStewardshipChecklist where AntibioticTrackingID=@AntibioticTrackingID
END
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticsCostSavingsTrackingRecommendedPerSiteByDate]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAntibioticsCostSavingsTrackingRecommendedPerSiteByDate]
	-- Add the parameters for the stored procedure here
	@SiteID int = null,
	@EnteredStartDateTime DATETIME = null,
	@EnteredEndDateTime DATETIME = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        @EnteredStartDateTime AS StartDate, @EnteredEndDateTime AS EndDate, Patients.PatientIN, Patients.FirstName + ' ' + Patients.LastName AS PatientName, 
	                         AntibioticsCostSavingsTracking.id, AntibioticsCostSavingsTracking.AntibioticTrackingID, AntibioticsCostSavingsTracking.DateEntered, 
	                         (SELECT Description from AntibioticsCostSavingsTrackingLookup where id = AntibioticsCostSavingsTracking.AntibioticDrug1) as Drug1,
							 (SELECT Cost from AntibioticsCostSavingsTrackingLookup where id = AntibioticsCostSavingsTracking.AntibioticDrug1) as Drug1Cost,  
							 (SELECT Description from AntibioticsCostSavingsTrackingLookup where id = AntibioticsCostSavingsTracking.AntibioticDrug1Frequency) as Drug1Frequency, 
	                         (SELECT Conversion from AntibioticsCostSavingsTrackingLookup where id = AntibioticsCostSavingsTracking.AntibioticDrug1Frequency) as Drug1FrequencyConversion,
							 (SELECT Description from AntibioticsCostSavingsTrackingLookup where id = AntibioticsCostSavingsTracking.AntibioticDrug2) as Drug2,
							 (SELECT Cost from AntibioticsCostSavingsTrackingLookup where id = AntibioticsCostSavingsTracking.AntibioticDrug2) as Drug2Cost,  
							 (SELECT Description from AntibioticsCostSavingsTrackingLookup where id = AntibioticsCostSavingsTracking.AntibioticDrug2Frequency) as Drug2Frequency, 
	                         (SELECT Conversion from AntibioticsCostSavingsTrackingLookup where id = AntibioticsCostSavingsTracking.AntibioticDrug2Frequency) as Drug2FrequencyConversion,    
	                         AntibioticsCostSavingsTracking.CostSavings, AntibioticsCostSavingsTracking.DateUpdated, AntibioticsCostSavingsTracking.EnteredBy, 
	                         AntibioticsCostSavingsTracking.UpdatedBy, AntibioticsCostSavingsTracking.Recommended, AntibioticsCostSavingsTracking.Accepted
	FROM            AntibioticTracking INNER JOIN
	                         AntibioticsCostSavingsTracking ON AntibioticTracking.AntibioticTrackingID = AntibioticsCostSavingsTracking.AntibioticTrackingID INNER JOIN
	                         Patients ON AntibioticTracking.PatientID = Patients.PatientID
	WHERE                    (Patients.SiteID = @SiteID) AND (AntibioticsCostSavingsTracking.DateEntered >= @EnteredStartDateTime) AND 
	                         (AntibioticsCostSavingsTracking.DateEntered < DATEADD(DAY, 1, @EnteredEndDateTime)) AND 
							 (AntibioticsCostSavingsTracking.Recommended = 1)

END
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticsCostSavingsTrackingByID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetAntibioticsCostSavingsTrackingByID]
	-- Add the parameters for the stored procedure here
	@ID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        id, AntibioticTrackingID, CONVERT(VARCHAR(10),DateEntered,101) as DateEntered, AntibioticDrug1, AntibioticDrug1Frequency, AntibioticDrug1Physician, AntibioticDrug2, AntibioticDrug2Frequency, 
	                         AntibioticDrug2Physician, CostSavings, DateUpdated, EnteredBy
	FROM            AntibioticsCostSavingsTracking
	WHERE        (id = @ID)

END
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticsCostSavingsTrackingByAntibioticTrackingID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetAntibioticsCostSavingsTrackingByAntibioticTrackingID]
	-- Add the parameters for the stored procedure here
	@AntibioticTrackingID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id, AntibioticTrackingID, DateEntered, 
		   AntibioticDrug1Frequency, (SELECT Description FROM AntibioticsCostSavingsTrackingLookup WHERE id = AntibioticDrug1) AS AntibioticDrug1, AntibioticDrug1Physician, 
		   (SELECT Description FROM AntibioticsCostSavingsTrackingLookup WHERE id = AntibioticDrug2) AS AntibioticDrug2, AntibioticDrug2Frequency, AntibioticDrug2Physician, 
		   CostSavings, DateUpdated, EnteredBy, Recommended, Accepted, UpdatedBy
	FROM            AntibioticsCostSavingsTracking
	where AntibioticTrackingID=@AntibioticTrackingID

END
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticsCostSavingsTrackingAcceptedPerSiteByDate]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAntibioticsCostSavingsTrackingAcceptedPerSiteByDate]
	-- Add the parameters for the stored procedure here
	@SiteID int = null,
	@EnteredStartDateTime DATETIME = null,
	@EnteredEndDateTime DATETIME = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        @EnteredStartDateTime AS StartDate, @EnteredEndDateTime AS EndDate, Patients.PatientIN, Patients.FirstName + ' ' + Patients.LastName AS PatientName, 
	                         AntibioticsCostSavingsTracking.id, AntibioticsCostSavingsTracking.AntibioticTrackingID, AntibioticsCostSavingsTracking.DateEntered, 
	                         (SELECT Description from AntibioticsCostSavingsTrackingLookup where id = AntibioticsCostSavingsTracking.AntibioticDrug1) as Drug1,
							 (SELECT Cost from AntibioticsCostSavingsTrackingLookup where id = AntibioticsCostSavingsTracking.AntibioticDrug1) as Drug1Cost,  
							 (SELECT Description from AntibioticsCostSavingsTrackingLookup where id = AntibioticsCostSavingsTracking.AntibioticDrug1Frequency) as Drug1Frequency, 
	                         (SELECT Conversion from AntibioticsCostSavingsTrackingLookup where id = AntibioticsCostSavingsTracking.AntibioticDrug1Frequency) as Drug1FrequencyConversion,
							 (SELECT Description from AntibioticsCostSavingsTrackingLookup where id = AntibioticsCostSavingsTracking.AntibioticDrug2) as Drug2,
							 (SELECT Cost from AntibioticsCostSavingsTrackingLookup where id = AntibioticsCostSavingsTracking.AntibioticDrug2) as Drug2Cost,  
							 (SELECT Description from AntibioticsCostSavingsTrackingLookup where id = AntibioticsCostSavingsTracking.AntibioticDrug2Frequency) as Drug2Frequency, 
	                         (SELECT Conversion from AntibioticsCostSavingsTrackingLookup where id = AntibioticsCostSavingsTracking.AntibioticDrug2Frequency) as Drug2FrequencyConversion,    
	                         AntibioticsCostSavingsTracking.CostSavings, AntibioticsCostSavingsTracking.DateUpdated, AntibioticsCostSavingsTracking.EnteredBy, 
	                         AntibioticsCostSavingsTracking.UpdatedBy, AntibioticsCostSavingsTracking.Recommended, AntibioticsCostSavingsTracking.Accepted
	FROM            AntibioticTracking INNER JOIN
	                         AntibioticsCostSavingsTracking ON AntibioticTracking.AntibioticTrackingID = AntibioticsCostSavingsTracking.AntibioticTrackingID INNER JOIN
	                         Patients ON AntibioticTracking.PatientID = Patients.PatientID
	WHERE                    (Patients.SiteID = @SiteID) AND (AntibioticsCostSavingsTracking.DateEntered >= @EnteredStartDateTime) AND 
	                         (AntibioticsCostSavingsTracking.DateEntered < DATEADD(DAY, 1, @EnteredEndDateTime)) AND 
							 (AntibioticsCostSavingsTracking.Accepted = 1)

END
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticPrescribedPerSiteByDate]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAntibioticPrescribedPerSiteByDate]
	-- Add the parameters for the stored procedure here
	@SiteID int = null,
	@EnteredStartDateTime DATETIME = null,
	@EnteredEndDateTime DATETIME = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT    @EnteredStartDateTime as StartDate, @EnteredEndDateTime as EndDate, AntibioticTracking.MedHistory, AntibioticTracking.OtherInfo, AntibioticTracking.EnteredDateTime, AntibioticTracking.EnteredBy, 
                      AntibioticAntibioticPrescribed.AntibioticPrescribedName, AntibioticAntibioticPrescribed.Dose, AntibioticAntibioticPrescribed.Frequency, 
                      AntibioticAntibioticPrescribed.StartDate, AntibioticAntibioticPrescribed.EndDate, Patients.PatientIN, (Patients.FirstName + ' ' + Patients.LastName) as PatientName, 
                      Patients.Age, Patients.DOB, Patients.Height, Patients.Weight, Patients.Sex, Patients.Room, Patients.EnteredBy AS Expr1
	FROM         AntibioticTracking INNER JOIN
                      AntibioticAntibioticPrescribed ON AntibioticTracking.AntibioticTrackingID = AntibioticAntibioticPrescribed.AntibioticTrackingID INNER JOIN
                      Patients ON AntibioticTracking.PatientID = Patients.PatientID
	WHERE     (Patients.SiteID = @SiteID and AntibioticTracking.EnteredDateTime >= @EnteredStartDateTime and AntibioticTracking.EnteredDateTime < DATEADD(DAY,1,@EnteredEndDateTime))

END
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticLabsByAntibioticTrackingID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetAntibioticLabsByAntibioticTrackingID]
	-- Add the parameters for the stored procedure here
	@AntibioticTrackingID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from AntibioticLabs where AntibioticTrackingID=@AntibioticTrackingID
END
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticIndicationPerSiteByDate]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAntibioticIndicationPerSiteByDate]
	-- Add the parameters for the stored procedure here
	@SiteID int = null,
	@EnteredStartDateTime DATETIME = null,
	@EnteredEndDateTime DATETIME = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     @EnteredStartDateTime as StartDate, @EnteredEndDateTime as EndDate, AntibioticTracking.MedHistory, AntibioticTracking.OtherInfo, AntibioticTracking.EnteredDateTime, AntibioticTracking.EnteredBy, 
                      AntibioticAntibioticIndication.AntibioticIndicationName, Patients.PatientIN, (Patients.FirstName + ' ' + Patients.LastName) as PatientName, Patients.Age, Patients.DOB, 
                      Patients.Height, Patients.Weight, Patients.Sex, Patients.Room, Patients.EnteredBy AS Expr1
	FROM         AntibioticTracking INNER JOIN
                      AntibioticAntibioticIndication ON AntibioticTracking.AntibioticTrackingID = AntibioticAntibioticIndication.AntibioticTrackingID 
                      INNER JOIN
                      Patients ON AntibioticTracking.PatientID = Patients.PatientID
	WHERE     (Patients.SiteID = @SiteID and AntibioticTracking.EnteredDateTime >= @EnteredStartDateTime and AntibioticTracking.EnteredDateTime < DATEADD(DAY,1,@EnteredEndDateTime))

END
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticAntibioticPrescribedByAntibioticTrackingID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetAntibioticAntibioticPrescribedByAntibioticTrackingID]
	-- Add the parameters for the stored procedure here
	@AntibioticTrackingID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from AntibioticAntibioticPrescribed where AntibioticTrackingID=@AntibioticTrackingID
END
GO
/****** Object:  StoredProcedure [dbo].[GetAntibioticAntibioticIndicationByAntibioticTrackingID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAntibioticAntibioticIndicationByAntibioticTrackingID]
	-- Add the parameters for the stored procedure here
	@AntibioticTrackingID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from AntibioticAntibioticIndication where AntibioticTrackingID=@AntibioticTrackingID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteWarfarinLab]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DeleteWarfarinLab]
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from WarfarinLabs where ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetTaskEmailList]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTaskEmailList]
	-- Add the parameters for the stored procedure here
	@TaskLogsTrackingId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT email from TaskLogsTrackingEmail where TaskLogsTrackingId=@TaskLogsTrackingId 
END
GO
/****** Object:  StoredProcedure [dbo].[GetRecentWarfarinLabsByWarfarinTrackingID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetRecentWarfarinLabsByWarfarinTrackingID]
	-- Add the parameters for the stored procedure here
	@WarfarinTrackingID int = null,
	@EnteredBy varchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 1 * from WarfarinLabs where WarfarinTrackingID=@WarfarinTrackingID
	ORDER BY ID desc
END
GO
/****** Object:  StoredProcedure [dbo].[GetRecentAntibioticLabsByAntibioticTrackingID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRecentAntibioticLabsByAntibioticTrackingID]
	-- Add the parameters for the stored procedure here
	@AntibioticTrackingID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 1 * from AntibioticLabs where AntibioticTrackingID=@AntibioticTrackingID
	ORDER BY LabDate desc
END
GO
/****** Object:  StoredProcedure [dbo].[GetInterventionsInterventionsByInterventionsID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetInterventionsInterventionsByInterventionsID]
	-- Add the parameters for the stored procedure here
	@InterventionsID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from InterventionsIntervention where InterventionsID=ISNULL(@InterventionsID,InterventionsID)
END
GO
/****** Object:  StoredProcedure [dbo].[GetWarfarinLabsInrPerSiteByDate]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetWarfarinLabsInrPerSiteByDate]
	-- Add the parameters for the stored procedure here
	@SiteID int = null,
	@EnteredStartDateTime DATETIME = null,
	@EnteredEndDateTime DATETIME = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        @EnteredStartDateTime AS StartDate, @EnteredEndDateTime AS EndDate, Patients.FirstName + ' ' + Patients.LastName AS PatientName, WarfarinLabs.LabDate, CONVERT(DECIMAL(18,2), WarfarinLabs.inr) as INR 
FROM            Patients INNER JOIN
                         WarfarinTracking ON Patients.PatientID = WarfarinTracking.PatientID INNER JOIN
                         WarfarinLabs ON WarfarinTracking.WarfarinTrackingID = WarfarinLabs.WarfarinTrackingID
WHERE     (Patients.SiteID = @SiteID) AND (WarfarinLabs.LabDate >= @EnteredStartDateTime) AND 
	                      (WarfarinLabs.LabDate < DATEADD(DAY, 1, @EnteredEndDateTime))
END
GO
/****** Object:  StoredProcedure [dbo].[GetWarfarinLabsByWarfarinTrackingID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetWarfarinLabsByWarfarinTrackingID]
	-- Add the parameters for the stored procedure here
	@WarfarinTrackingID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from WarfarinLabs where WarfarinTrackingID=@WarfarinTrackingID order by ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetTaskLogsTrackingById]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTaskLogsTrackingById]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from TaskLogsTracking WHERE id = @id

	SELECT * from TaskLogsTrackingEmail where TaskLogsTrackingId = @id
END
GO
/****** Object:  StoredProcedure [dbo].[GetWarfarinWarfarinInrGoalPerSiteByDate]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetWarfarinWarfarinInrGoalPerSiteByDate]
	-- Add the parameters for the stored procedure here
	@SiteID int = null,
	@EnteredStartDateTime DATETIME = null,
	@EnteredEndDateTime DATETIME = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     @EnteredStartDateTime AS StartDate, @EnteredEndDateTime AS EndDate, WarfarinTracking.EnteredDateTime, WarfarinTracking.EnteredBy, 
	                      Patients.FirstName + ' ' + Patients.LastName AS PatientName, WarfarinWarfarinInrGoal.WarfarinInrGoal, WarfarinIndication.WarfarinIndicationText
	FROM         WarfarinTracking INNER JOIN
	                      Patients ON WarfarinTracking.PatientID = Patients.PatientID INNER JOIN
	                      WarfarinIndication ON WarfarinTracking.WarfarinTrackingID = WarfarinIndication.WarfarinTrackingID INNER JOIN
	                      WarfarinWarfarinInrGoal ON WarfarinIndication.ID = WarfarinWarfarinInrGoal.WarfarinIndicationID
	WHERE     (Patients.SiteID = @SiteID) AND (WarfarinTracking.EnteredDateTime >= @EnteredStartDateTime) AND 
	                      (WarfarinTracking.EnteredDateTime < DATEADD(DAY, 1, @EnteredEndDateTime))
END
GO
/****** Object:  StoredProcedure [dbo].[GetWarfarinWarfarinInrGoalByWarfarinIndicationID]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetWarfarinWarfarinInrGoalByWarfarinIndicationID]
	-- Add the parameters for the stored procedure here
	@WarfarinIndicationID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from WarfarinWarfarinInrGoal where WarfarinIndicationID=@WarfarinIndicationID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteWarfarinWarfarinInrGoal]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteWarfarinWarfarinInrGoal]
	-- Add the parameters for the stored procedure here
	@WarfarinIndicationID int,
	@WarfarinInrGoal varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	delete from WarfarinWarfarinInrGoal where WarfarinIndicationID=@WarfarinIndicationID AND WarfarinInrGoal=@WarfarinInrGoal
	
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateWarfarinWarfarinInrGoal]    Script Date: 01/01/2015 22:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUpdateWarfarinWarfarinInrGoal]
	-- Add the parameters for the stored procedure here
	    @ID int = null,
		@WarfarinIndicationID int = null,
		@WarfarinInrGoal varchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
	if (select COUNT (*) from WarfarinWarfarinInrGoal where WarfarinIndicationID=@WarfarinIndicationID AND WarfarinInrGoal=@WarfarinInrGoal) = 0 
	begin
		INSERT INTO WarfarinWarfarinInrGoal  (WarfarinIndicationID,WarfarinInrGoal) values (@WarfarinIndicationID,@WarfarinInrGoal)
	end
	
END
GO
/****** Object:  ForeignKey [FK_AntibioticAntibioticIndication_AntibioticTracking]    Script Date: 01/01/2015 22:24:24 ******/
ALTER TABLE [dbo].[AntibioticAntibioticIndication]  WITH CHECK ADD  CONSTRAINT [FK_AntibioticAntibioticIndication_AntibioticTracking] FOREIGN KEY([AntibioticTrackingID])
REFERENCES [dbo].[AntibioticTracking] ([AntibioticTrackingID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AntibioticAntibioticIndication] CHECK CONSTRAINT [FK_AntibioticAntibioticIndication_AntibioticTracking]
GO
/****** Object:  ForeignKey [FK_AntibioticAntibioticPrescribed_AntibioticTracking]    Script Date: 01/01/2015 22:24:24 ******/
ALTER TABLE [dbo].[AntibioticAntibioticPrescribed]  WITH CHECK ADD  CONSTRAINT [FK_AntibioticAntibioticPrescribed_AntibioticTracking] FOREIGN KEY([AntibioticTrackingID])
REFERENCES [dbo].[AntibioticTracking] ([AntibioticTrackingID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AntibioticAntibioticPrescribed] CHECK CONSTRAINT [FK_AntibioticAntibioticPrescribed_AntibioticTracking]
GO
/****** Object:  ForeignKey [FK_AntibioticLabs_AntibioticTracking]    Script Date: 01/01/2015 22:24:24 ******/
ALTER TABLE [dbo].[AntibioticLabs]  WITH CHECK ADD  CONSTRAINT [FK_AntibioticLabs_AntibioticTracking] FOREIGN KEY([AntibioticTrackingID])
REFERENCES [dbo].[AntibioticTracking] ([AntibioticTrackingID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AntibioticLabs] CHECK CONSTRAINT [FK_AntibioticLabs_AntibioticTracking]
GO
/****** Object:  ForeignKey [FK_AntibioticsCostSavingsDaysTherapy_Sites]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[AntibioticsCostSavingsDaysTherapy]  WITH CHECK ADD  CONSTRAINT [FK_AntibioticsCostSavingsDaysTherapy_Sites] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Sites] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AntibioticsCostSavingsDaysTherapy] CHECK CONSTRAINT [FK_AntibioticsCostSavingsDaysTherapy_Sites]
GO
/****** Object:  ForeignKey [FK_AntibioticsCostSavingsTracking_AntibioticTracking1]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[AntibioticsCostSavingsTracking]  WITH CHECK ADD  CONSTRAINT [FK_AntibioticsCostSavingsTracking_AntibioticTracking1] FOREIGN KEY([AntibioticTrackingID])
REFERENCES [dbo].[AntibioticTracking] ([AntibioticTrackingID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AntibioticsCostSavingsTracking] CHECK CONSTRAINT [FK_AntibioticsCostSavingsTracking_AntibioticTracking1]
GO
/****** Object:  ForeignKey [FK_AntibioticStewardshipChecklist_AntibioticTracking]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[AntibioticStewardshipChecklist]  WITH CHECK ADD  CONSTRAINT [FK_AntibioticStewardshipChecklist_AntibioticTracking] FOREIGN KEY([AntibioticTrackingID])
REFERENCES [dbo].[AntibioticTracking] ([AntibioticTrackingID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AntibioticStewardshipChecklist] CHECK CONSTRAINT [FK_AntibioticStewardshipChecklist_AntibioticTracking]
GO
/****** Object:  ForeignKey [FK_AntibioticTracking_Patients]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[AntibioticTracking]  WITH CHECK ADD  CONSTRAINT [FK_AntibioticTracking_Patients] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patients] ([PatientID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AntibioticTracking] CHECK CONSTRAINT [FK_AntibioticTracking_Patients]
GO
/****** Object:  ForeignKey [FK_CompoundedDrugsDetails_CompoundedDrugs]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[CompoundedDrugsDetails]  WITH CHECK ADD  CONSTRAINT [FK_CompoundedDrugsDetails_CompoundedDrugs] FOREIGN KEY([CompoundedDrugID])
REFERENCES [dbo].[CompoundedDrugs] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CompoundedDrugsDetails] CHECK CONSTRAINT [FK_CompoundedDrugsDetails_CompoundedDrugs]
GO
/****** Object:  ForeignKey [FK_Interventions_Patients]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[Interventions]  WITH CHECK ADD  CONSTRAINT [FK_Interventions_Patients] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patients] ([PatientID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Interventions] CHECK CONSTRAINT [FK_Interventions_Patients]
GO
/****** Object:  ForeignKey [FK_InterventionsIntervention_Interventions]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[InterventionsIntervention]  WITH CHECK ADD  CONSTRAINT [FK_InterventionsIntervention_Interventions] FOREIGN KEY([InterventionsID])
REFERENCES [dbo].[Interventions] ([InterventionsID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InterventionsIntervention] CHECK CONSTRAINT [FK_InterventionsIntervention_Interventions]
GO
/****** Object:  ForeignKey [FK_InterventionTypes_Sites]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[InterventionTypes]  WITH CHECK ADD  CONSTRAINT [FK_InterventionTypes_Sites] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Sites] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InterventionTypes] CHECK CONSTRAINT [FK_InterventionTypes_Sites]
GO
/****** Object:  ForeignKey [FK_PatientAllergies_Patients]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[PatientAllergies]  WITH CHECK ADD  CONSTRAINT [FK_PatientAllergies_Patients] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patients] ([PatientID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PatientAllergies] CHECK CONSTRAINT [FK_PatientAllergies_Patients]
GO
/****** Object:  ForeignKey [FK_Patients_Patients]    Script Date: 01/01/2015 22:24:25 ******/
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Patients] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patients] ([PatientID])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Patients]
GO
/****** Object:  ForeignKey [FK_TaskLogDetails_TaskLog]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[TaskLogDetails]  WITH CHECK ADD  CONSTRAINT [FK_TaskLogDetails_TaskLog] FOREIGN KEY([TaskID])
REFERENCES [dbo].[TaskLog] ([TaskID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaskLogDetails] CHECK CONSTRAINT [FK_TaskLogDetails_TaskLog]
GO
/****** Object:  ForeignKey [FK_TaskLogsTracking_Sites]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[TaskLogsTracking]  WITH CHECK ADD  CONSTRAINT [FK_TaskLogsTracking_Sites] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Sites] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaskLogsTracking] CHECK CONSTRAINT [FK_TaskLogsTracking_Sites]
GO
/****** Object:  ForeignKey [FK_TaskLogsTrackingEmail_TaskLogsTracking]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[TaskLogsTrackingEmail]  WITH CHECK ADD  CONSTRAINT [FK_TaskLogsTrackingEmail_TaskLogsTracking] FOREIGN KEY([TaskLogsTrackingId])
REFERENCES [dbo].[TaskLogsTracking] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaskLogsTrackingEmail] CHECK CONSTRAINT [FK_TaskLogsTrackingEmail_TaskLogsTracking]
GO
/****** Object:  ForeignKey [FK_WarfarinIndication_WarfarinTracking]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[WarfarinIndication]  WITH CHECK ADD  CONSTRAINT [FK_WarfarinIndication_WarfarinTracking] FOREIGN KEY([WarfarinTrackingID])
REFERENCES [dbo].[WarfarinTracking] ([WarfarinTrackingID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WarfarinIndication] CHECK CONSTRAINT [FK_WarfarinIndication_WarfarinTracking]
GO
/****** Object:  ForeignKey [FK_WarfarinLabs_WarfarinTracking]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[WarfarinLabs]  WITH CHECK ADD  CONSTRAINT [FK_WarfarinLabs_WarfarinTracking] FOREIGN KEY([WarfarinTrackingID])
REFERENCES [dbo].[WarfarinTracking] ([WarfarinTrackingID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WarfarinLabs] CHECK CONSTRAINT [FK_WarfarinLabs_WarfarinTracking]
GO
/****** Object:  ForeignKey [FK_WarfarinTracking_Patients]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[WarfarinTracking]  WITH CHECK ADD  CONSTRAINT [FK_WarfarinTracking_Patients] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patients] ([PatientID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WarfarinTracking] CHECK CONSTRAINT [FK_WarfarinTracking_Patients]
GO
/****** Object:  ForeignKey [FK_WarfarinWarfarinInrGoal_WarfarinIndication]    Script Date: 01/01/2015 22:24:26 ******/
ALTER TABLE [dbo].[WarfarinWarfarinInrGoal]  WITH CHECK ADD  CONSTRAINT [FK_WarfarinWarfarinInrGoal_WarfarinIndication] FOREIGN KEY([WarfarinIndicationID])
REFERENCES [dbo].[WarfarinIndication] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WarfarinWarfarinInrGoal] CHECK CONSTRAINT [FK_WarfarinWarfarinInrGoal_WarfarinIndication]
GO
