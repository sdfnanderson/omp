{**
 * templates/controllers/tab/settings/form/newImageFileUploadForm.tpl
 *
 * Copyright (c) 2003-2011 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Image file upload form.
 *}

<script type="text/javascript">
	// Attach the file upload form handler.
	$(function() {ldelim}
		$('#uploadForm').pkpHandler(
			'$.pkp.controllers.form.FileUploadFormHandler',
			{ldelim}
				$uploader: $('#uploadForm #plupload'),
				uploaderOptions: {ldelim}
					uploadUrl: '{url|escape:javascript op="uploadFile" fileSettingName=$fileSettingName fileType=$fileType escape=false}',
					baseUrl: '{$baseUrl|escape:javascript}'
				{rdelim}
			{rdelim}
		);
	{rdelim});
</script>

<form id="uploadForm" class="pkp_form pkp_controllers_form" action="{url op="saveFile" fileSettingName=$fileSettingName fileType=$fileType}" method="post" class="pkp_controllers_form">
	<input type="hidden" name="temporaryFileId" id="temporaryFileId" value="" />
	{fbvFormArea id="file"}
		{fbvFormSection title="common.file"}
			<div id="plupload"></div>
		{/fbvFormSection}
	{/fbvFormArea}
	{fbvFormArea id="extraFileData"}
		{fbvFormSection title="common.altText"}
			{fbvElement type="text" multilingual=true id="imageAltText" value=$imageAltText}
			<span class="instruct">{translate key="common.altTextInstructions"}</span>
		{/fbvFormSection}
	{/fbvFormArea}

	{include file="form/formButtons.tpl"}
</form>