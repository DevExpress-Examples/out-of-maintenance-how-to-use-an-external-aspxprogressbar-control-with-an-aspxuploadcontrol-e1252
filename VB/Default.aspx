<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="UploadControl_UploadButtonProgress" %>

<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web"
	TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web"
	TagPrefix="dxuc" %>
<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web"
	TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Untitled Page</title>
	<link href="styles.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript">
		var uploadedFilesFlag;
		function OnBtnUploadClick(s, e){
			if(uploadControl.GetText() != ""){
				uploadedFilesFlag = null;
				lblCompleteMessage.SetVisible(false);
				pbUpload.SetPosition(0);
				uploadControl.Upload();
				btnUpload.SetEnabled(false);
				pnlProgress.SetVisible(true);
			}
		}

		function OnUploadProgressChanged(s, e){
			pbUpload.SetPosition(e.progress);
		}

		function OnFileUploadComplete(s, e){
			uploadedFilesFlag = e.isValid;
		}

		function OnFilesUploadComplete(s, e){
			if(uploadedFilesFlag){
				btnCancel.SetVisible(false);
				btnUpload.SetEnabled(true);
				pbUpload.SetPosition(100);
				lblCompleteMessage.SetVisible(true);
			}
			else{
				btnUpload.SetEnabled(true);
				pnlProgress.SetVisible(false);
			}
		}

		function OnBtnCancelClick(s, e){
			uploadControl.Cancel();
			btnUpload.SetEnabled(true);
			pnlProgress.SetVisible(false);
		}

		function OnUploadControlTextChanged(s, e){
			btnUpload.SetEnabled(s.GetText() != "");
		}
	</script>

</head>
<body>
	<form id="form1" runat="server">
		<div>
			<dxe:ASPxLabel ID="lblFileSizeMessage" runat="server" Text="The size of a file to upload shouldn't be greater than 5000 Kb."/>
			<br />
			<br />
			<table cellpadding="0" cellspacing="3" border="0" class="main">
				<tr>
					<td class="uploadControlCell" style="height: 82px">
						<dxuc:ASPxUploadControl ID="uc" ClientInstanceName="uploadControl" runat="server" UploadMode="Auto">
							<ValidationSettings MaxFileSize="5000"></ValidationSettings>
							<ClientSideEvents UploadingProgressChanged="OnUploadProgressChanged" FilesUploadComplete="OnFilesUploadComplete"
								FileUploadComplete="OnFileUploadComplete" TextChanged="OnUploadControlTextChanged" />
						</dxuc:ASPxUploadControl>
					</td>
					<td class="btnUploadCell" style="height: 82px">
						<dxe:ASPxButton ID="btnUpload" ClientInstanceName="btnUpload" runat="server" Text="Upload"
							AutoPostBack="False">
							<ClientSideEvents Click="OnBtnUploadClick" />
						</dxe:ASPxButton>
					</td>
					<td style="height: 82px">
						<dxp:ASPxPanel ID="pnlProgress" ClientInstanceName="pnlProgress" runat="server" ClientVisible="False">
							<PanelCollection>
								<dxp:PanelContent runat="server">
									<table cellpadding="0" cellspacing="0" border="0" class="progressTable">
										<tr>
											<td class="progressBarCell">
												<dxe:ASPxProgressBar ID="pbUpload" ClientInstanceName="pbUpload" runat="server" Width="200px"
													Height="23px" />
											</td>
											<td>
												<dxe:ASPxButton ID="btnCancel" ClientInstanceName="btnCancel" runat="server" Text="Cancel"
													AutoPostBack="False">
													<ClientSideEvents Click="OnBtnCancelClick" />
												</dxe:ASPxButton>
											</td>
											<td>
												<dxe:ASPxLabel ID="lblCompleteMessage" ClientInstanceName="lblCompleteMessage" ClientVisible="False"
													runat="server" Text="Upload completed" />
											</td>
										</tr>
									</table>
								</dxp:PanelContent>
							</PanelCollection>
						</dxp:ASPxPanel>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>