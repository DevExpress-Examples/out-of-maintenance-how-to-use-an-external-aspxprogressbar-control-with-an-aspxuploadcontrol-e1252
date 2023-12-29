<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Site/Default.aspx)
* [Default.aspx.cs](./CS/Site/Default.aspx.cs)
<!-- default file list end -->
# How to use an external ASPxProgressBar control with an ASPxUploadControl


<p>In this example, the ASPxProgressBar control is used to visualize the progress of file uploading initiated within the ASPxUploadControl. The UploadingProgressChanged client event of the ASPxUploadControl is handled to supply the ASPxProgressBar control with the current progress information. Using the ASPxProgressBar as a separate control allows placing it at any desired position within the page.<br />
To enable the progress panel functionality and make the client <strong>UploadingProgressChanged</strong> event fire, the special <strong>ASPxUploadProgressHttpHandler</strong> and <strong>ASPxHttpHandlerModule</strong> should be registered within a web project's Web.Config file. See the "Web.config" tab for more detail.</p>

<br/>


