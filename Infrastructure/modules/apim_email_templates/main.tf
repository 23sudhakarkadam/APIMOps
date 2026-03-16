locals {
  apim_name           = var.apim_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_api_management_email_template" "account_closed_developer" {
  api_management_name = local.apim_name
  resource_group_name = local.resource_group_name
  template_name       = "AccountClosedDeveloper"
  subject             = "Thank you for using the $OrganizationName API!"
  body = replace(chomp(<<-HTML
    <!DOCTYPE html >
    <html>
      <head />
      <body>
        <p style="font-size:12pt;font-family:'Segoe UI'">Dear $DevFirstName $DevLastName,</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">
              On behalf of $OrganizationName and our customers we thank you for giving us a try. Your $OrganizationName API account is now closed.
            </p>
        <p style="font-size:12pt;font-family:'Segoe UI'">Thank you,</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">Your $OrganizationName Team</p>
        <a href="$DevPortalUrl">$DevPortalUrl</a>
        <p />
      </body>
    </html>
  HTML
  ), "\n", "\r\n")
}

resource "azurerm_api_management_email_template" "application_approved" {
  api_management_name = local.apim_name
  resource_group_name = local.resource_group_name
  template_name       = "ApplicationApprovedNotificationMessage"
  subject             = "Your application $AppName is published in the application gallery"
  body = replace(chomp(<<-HTML
    <!DOCTYPE html >
    <html>
      <head />
      <body>
        <p style="font-size:12pt;font-family:'Segoe UI'">Dear $DevFirstName $DevLastName,</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">
              We are happy to let you know that your request to publish the $AppName application in the application gallery has been approved. Your application has been published and can be viewed <a href="http://$DevPortalUrl/Applications/Details/$AppId">here</a>.
            </p>
        <p style="font-size:12pt;font-family:'Segoe UI'">Best,</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">The $OrganizationName API Team</p>
      </body>
    </html>
  HTML
  ), "\n", "\r\n")
}

resource "azurerm_api_management_email_template" "confirm_sign_up" {
  api_management_name = local.apim_name
  resource_group_name = local.resource_group_name
  template_name       = "ConfirmSignUpIdentityDefault"
  subject             = "Please confirm your new $OrganizationName API account"
  body = replace(chomp(<<-HTML
    <!DOCTYPE html >
    <html>
      <head>
        <meta charset="UTF-8" />
        <title>Letter</title>
      </head>
      <body>
        <table width="100%">
          <tr>
            <td>
              <p style="font-size:12pt;font-family:'Segoe UI'">Dear $DevFirstName $DevLastName,</p>
              <p style="font-size:12pt;font-family:'Segoe UI'"></p>
              <p style="font-size:12pt;font-family:'Segoe UI'">Thank you for joining the $OrganizationName API program! We host a growing number of cool APIs and strive to provide an awesome experience for API developers.</p>
              <p style="font-size:12pt;font-family:'Segoe UI'">First order of business is to activate your account and get you going. To that end, please click on the following link:</p>
              <p style="font-size:12pt;font-family:'Segoe UI'">
                <a id="confirmUrl" href="$ConfirmUrl" style="text-decoration:none">
                  <strong>$ConfirmUrl</strong>
                </a>
              </p>
              <p style="font-size:12pt;font-family:'Segoe UI'">If clicking the link does not work, please copy-and-paste or re-type it into your browser's address bar and hit "Enter".</p>
              <p style="font-size:12pt;font-family:'Segoe UI'">Thank you,</p>
              <p style="font-size:12pt;font-family:'Segoe UI'">$OrganizationName API Team</p>
              <p style="font-size:12pt;font-family:'Segoe UI'">
                <a href="$DevPortalUrl">$DevPortalUrl</a>
              </p>
            </td>
          </tr>
        </table>
      </body>
    </html>
  HTML
  ), "\n", "\r\n")
}

resource "azurerm_api_management_email_template" "email_change" {
  api_management_name = local.apim_name
  resource_group_name = local.resource_group_name
  template_name       = "EmailChangeIdentityDefault"
  subject             = "Please confirm the new email associated with your $OrganizationName API account"
  body = replace(chomp(<<-HTML
    <!DOCTYPE html >
    <html>
      <head>
        <meta charset="UTF-8" />
        <title>Letter</title>
      </head>
      <body>
        <table width="100%">
          <tr>
            <td>
              <p style="font-size:12pt;font-family:'Segoe UI'">Dear $DevFirstName $DevLastName,</p>
              <p style="font-size:12pt;font-family:'Segoe UI'"></p>
              <p style="font-size:12pt;font-family:'Segoe UI'">You are receiving this email because you made a change to the email address on your $OrganizationName API account.</p>
              <p style="font-size:12pt;font-family:'Segoe UI'">Please click on the following link to confirm the change:</p>
              <p style="font-size:12pt;font-family:'Segoe UI'">
                <a id="confirmUrl" href="$ConfirmUrl" style="text-decoration:none">
                  <strong>$ConfirmUrl</strong>
                </a>
              </p>
              <p style="font-size:12pt;font-family:'Segoe UI'">If clicking the link does not work, please copy-and-paste or re-type it into your browser's address bar and hit "Enter".</p>
              <p style="font-size:12pt;font-family:'Segoe UI'">Thank you,</p>
              <p style="font-size:12pt;font-family:'Segoe UI'">$OrganizationName API Team</p>
              <p style="font-size:12pt;font-family:'Segoe UI'">
                <a href="$DevPortalUrl">$DevPortalUrl</a>
              </p>
            </td>
          </tr>
        </table>
      </body>
    </html>
  HTML
  ), "\n", "\r\n")
}

resource "azurerm_api_management_email_template" "invite_user" {
  api_management_name = local.apim_name
  resource_group_name = local.resource_group_name
  template_name       = "InviteUserNotificationMessage"
  subject             = "You are invited to join the $OrganizationName developer network"
  body = replace(chomp(<<-HTML
    <!DOCTYPE html >
    <html>
      <head />
      <body>
        <p style="font-size:12pt;font-family:'Segoe UI'">Dear $DevFirstName $DevLastName,</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">
              Your account has been created. Please follow the link below to visit the $OrganizationName developer portal and claim it:
            </p>
        <p style="font-size:12pt;font-family:'Segoe UI'">
          <a href="$ConfirmUrl">$ConfirmUrl</a>
        </p>
        <p style="font-size:12pt;font-family:'Segoe UI'">Best,</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">The $OrganizationName API Team</p>
      </body>
    </html>
  HTML
  ), "\n", "\r\n")
}

resource "azurerm_api_management_email_template" "new_comment" {
  api_management_name = local.apim_name
  resource_group_name = local.resource_group_name
  template_name       = "NewCommentNotificationMessage"
  subject             = "$IssueName issue has a new comment"
  body = replace(chomp(<<-HTML
    <!DOCTYPE html >
    <html>
      <head />
      <body>
        <p style="font-size:12pt;font-family:'Segoe UI'">Dear $DevFirstName $DevLastName,</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">This is a brief note to let you know that $CommenterFirstName $CommenterLastName made the following comment on the issue $IssueName you created:</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">$CommentText</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">
              To view the issue on the developer portal click <a href="http://$DevPortalUrl/issues/$IssueId">here</a>.
            </p>
        <p style="font-size:12pt;font-family:'Segoe UI'">Best,</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">The $OrganizationName API Team</p>
      </body>
    </html>
  HTML
  ), "\n", "\r\n")
}

resource "azurerm_api_management_email_template" "new_developer" {
  api_management_name = local.apim_name
  resource_group_name = local.resource_group_name
  template_name       = "NewDeveloperNotificationMessage"
  subject             = "Welcome to the $OrganizationName API!"
  body = replace(chomp(<<-HTML
    <!DOCTYPE html >
    <html>
      <head>
        <meta charset="UTF-8" />
        <title>Letter</title>
      </head>
      <body>
        <h1 style="color:#000505;font-size:18pt;font-family:'Segoe UI'">
              Welcome to <span style="color:#003363">$OrganizationName API!</span></h1>
        <p style="font-size:12pt;font-family:'Segoe UI'">Dear $DevFirstName $DevLastName,</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">Your $OrganizationName API program registration is completed and we are thrilled to have you as a customer. Here are a few important bits of information for your reference:</p>
        <table width="100%" style="margin:20px 0">
          <tr>
                #if ($IdentityProvider == "Basic")
                <td width="50%" style="height:40px;vertical-align:top;font-family:'Segoe UI';font-size:12pt">
                  Please use the following <strong>username</strong> when signing into any of the $${OrganizationName}-hosted developer portals:
                </td><td style="vertical-align:top;font-family:'Segoe UI';font-size:12pt"><strong>$DevUsername</strong></td>
                #else
                <td width="50%" style="height:40px;vertical-align:top;font-family:'Segoe UI';font-size:12pt">
                  Please use the following <strong>$IdentityProvider account</strong> when signing into any of the $${OrganizationName}-hosted developer portals:
                </td><td style="vertical-align:top;font-family:'Segoe UI';font-size:12pt"><strong>$DevUsername</strong></td>            
                #end
              </tr>
          <tr>
            <td style="height:40px;vertical-align:top;font-family:'Segoe UI';font-size:12pt">
                  We will direct all communications to the following <strong>email address</strong>:
                </td>
            <td style="vertical-align:top;font-family:'Segoe UI';font-size:12pt">
              <a href="mailto:$DevEmail" style="text-decoration:none">
                <strong>$DevEmail</strong>
              </a>
            </td>
          </tr>
        </table>
        <p style="font-size:12pt;font-family:'Segoe UI'">Best of luck in your API pursuits!</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">$OrganizationName API Team</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">
          <a href="http://$DevPortalUrl">$DevPortalUrl</a>
        </p>
      </body>
    </html>
  HTML
  ), "\n", "\r\n")
}

resource "azurerm_api_management_email_template" "new_issue" {
  api_management_name = local.apim_name
  resource_group_name = local.resource_group_name
  template_name       = "NewIssueNotificationMessage"
  subject             = "Your request $IssueName was received"
  body = replace(chomp(<<-HTML
    <!DOCTYPE html >
    <html>
      <head />
      <body>
        <p style="font-size:12pt;font-family:'Segoe UI'">Dear $DevFirstName $DevLastName,</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">Thank you for contacting us. Our API team will review your issue and get back to you soon.</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">
              Click this <a href="http://$DevPortalUrl/issues/$IssueId">link</a> to view or edit your request.
            </p>
        <p style="font-size:12pt;font-family:'Segoe UI'">Best,</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">The $OrganizationName API Team</p>
      </body>
    </html>
  HTML
  ), "\n", "\r\n")
}

resource "azurerm_api_management_email_template" "password_reset_by_admin" {
  api_management_name = local.apim_name
  resource_group_name = local.resource_group_name
  template_name       = "PasswordResetByAdminNotificationMessage"
  subject             = "Your password was reset"
  body = replace(chomp(<<-HTML
    <!DOCTYPE html >
    <html>
      <head />
      <body>
        <table width="100%">
          <tr>
            <td>
              <p style="font-size:12pt;font-family:'Segoe UI'">Dear $DevFirstName $DevLastName,</p>
              <p style="font-size:12pt;font-family:'Segoe UI'"></p>
              <p style="font-size:12pt;font-family:'Segoe UI'">The password of your $OrganizationName API account has been reset, per your request.</p>
              <p style="font-size:12pt;font-family:'Segoe UI'">
                    Your new password is: <strong>$DevPassword</strong></p>
              <p style="font-size:12pt;font-family:'Segoe UI'">Please make sure to change it next time you sign in.</p>
              <p style="font-size:12pt;font-family:'Segoe UI'">Thank you,</p>
              <p style="font-size:12pt;font-family:'Segoe UI'">$OrganizationName API Team</p>
              <p style="font-size:12pt;font-family:'Segoe UI'">
                <a href="$DevPortalUrl">$DevPortalUrl</a>
              </p>
            </td>
          </tr>
        </table>
      </body>
    </html>
  HTML
  ), "\n", "\r\n")
}

resource "azurerm_api_management_email_template" "password_reset" {
  api_management_name = local.apim_name
  resource_group_name = local.resource_group_name
  template_name       = "PasswordResetIdentityDefault"
  subject             = "Your password change request"
  body = replace(chomp(<<-HTML
    <!DOCTYPE html >
    <html>
      <head>
        <meta charset="UTF-8" />
        <title>Letter</title>
      </head>
      <body>
        <table width="100%">
          <tr>
            <td>
              <p style="font-size:12pt;font-family:'Segoe UI'">Dear $DevFirstName $DevLastName,</p>
              <p style="font-size:12pt;font-family:'Segoe UI'"></p>
              <p style="font-size:12pt;font-family:'Segoe UI'">You are receiving this email because you requested to change the password on your $OrganizationName API account.</p>
              <p style="font-size:12pt;font-family:'Segoe UI'">Please click on the link below and follow instructions to create your new password:</p>
              <p style="font-size:12pt;font-family:'Segoe UI'">
                <a id="resetUrl" href="$ConfirmUrl" style="text-decoration:none">
                  <strong>$ConfirmUrl</strong>
                </a>
              </p>
              <p style="font-size:12pt;font-family:'Segoe UI'">If clicking the link does not work, please copy-and-paste or re-type it into your browser's address bar and hit "Enter".</p>
              <p style="font-size:12pt;font-family:'Segoe UI'">Thank you,</p>
              <p style="font-size:12pt;font-family:'Segoe UI'">$OrganizationName API Team</p>
              <p style="font-size:12pt;font-family:'Segoe UI'">
                <a href="$DevPortalUrl">$DevPortalUrl</a>
              </p>
            </td>
          </tr>
        </table>
      </body>
    </html>
  HTML
  ), "\n", "\r\n")
}

resource "azurerm_api_management_email_template" "purchase_developer" {
  api_management_name = local.apim_name
  resource_group_name = local.resource_group_name
  template_name       = "PurchaseDeveloperNotificationMessage"
  subject             = "Your subscription to the $ProdName"
  body = replace(chomp(<<-HTML
    <!DOCTYPE html >
    <html>
      <head />
      <body>
        <p style="font-size:12pt;font-family:'Segoe UI'">Greetings $DevFirstName $DevLastName!</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">
              Thank you for subscribing to the <a href="http://$DevPortalUrl/product#product=$ProdId"><strong>$ProdName</strong></a> and welcome to the $OrganizationName developer community. We are delighted to have you as part of the team and are looking forward to the amazing applications you will build using our API!
            </p>
        <p style="font-size:12pt;font-family:'Segoe UI'">Below are a few subscription details for your reference:</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">
          <ul>
                #if ($SubStartDate != "")
                <li style="font-size:12pt;font-family:'Segoe UI'">Start date: $SubStartDate</li>
                #end
            
                #if ($SubTerm != "")
                <li style="font-size:12pt;font-family:'Segoe UI'">Subscription term: $SubTerm</li>
                #end
              </ul>
        </p>
        <p style="font-size:12pt;font-family:'Segoe UI'">
                Visit the developer <a href="http://$DevPortalUrl/profile">profile area</a> to manage your subscription and subscription keys
            </p>
        <p style="font-size:12pt;font-family:'Segoe UI'">A couple of pointers to help get you started:</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">
          <strong>
            <a href="http://$DevPortalUrl/product#product=$ProdId">Learn about the API</a>
          </strong>
        </p>
        <p style="font-size:12pt;font-family:'Segoe UI'">The API documentation provides all information necessary to make a request and to process a response. Code samples are provided per API operation in a variety of languages. Moreover, an interactive console allows making API calls directly from the developer portal without writing any code.</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">Happy hacking,</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">The $OrganizationName API Team</p>
        <a style="font-size:12pt;font-family:'Segoe UI'" href="http://$DevPortalUrl">$DevPortalUrl</a>
      </body>
    </html>
  HTML
  ), "\n", "\r\n")
}

resource "azurerm_api_management_email_template" "quota_limit_approaching" {
  api_management_name = local.apim_name
  resource_group_name = local.resource_group_name
  template_name       = "QuotaLimitApproachingDeveloperNotificationMessage"
  subject             = "You are approaching an API quota limit"
  body = replace(chomp(<<-HTML
    <!DOCTYPE html >
    <html>
      <head>
        <style>
              body {font-size:12pt; font-family:"Segoe UI","Segoe WP","Tahoma","Arial","sans-serif";}
              .alert { color: red; }
              .child1 { padding-left: 20px; }
              .child2 { padding-left: 40px; }
              .number { text-align: right; }
              .text { text-align: left; }
              th, td { padding: 4px 10px; min-width: 100px; }
              th { background-color: #DDDDDD;}
            </style>
      </head>
      <body>
        <p>Greetings $DevFirstName $DevLastName!</p>
        <p>
              You are approaching the quota limit on you subscription to the <strong>$ProdName</strong> product (primary key $SubPrimaryKey).
              #if ($QuotaResetDate != "")
              This quota will be renewed on $QuotaResetDate.
              #else
              This quota will not be renewed.
              #end
            </p>
        <p>Below are details on quota usage for the subscription:</p>
        <p>
          <table>
            <thead>
              <th class="text">Quota Scope</th>
              <th class="number">Calls</th>
              <th class="number">Call Quota</th>
              <th class="number">Bandwidth</th>
              <th class="number">Bandwidth Quota</th>
            </thead>
            <tbody>
              <tr>
                <td class="text">Subscription</td>
                <td class="number">
                      #if ($CallsAlert == true)
                      <span class="alert">$Calls</span>
                      #else
                      $Calls
                      #end
                    </td>
                <td class="number">$CallQuota</td>
                <td class="number">
                      #if ($BandwidthAlert == true)
                      <span class="alert">$Bandwidth</span>
                      #else
                      $Bandwidth
                      #end
                    </td>
                <td class="number">$BandwidthQuota</td>
              </tr>
                  #foreach ($api in $Apis)
                  <tr><td class="child1 text">API: $api.Name</td><td class="number">
                      #if ($api.CallsAlert == true)
                      <span class="alert">$api.Calls</span>
                      #else
                      $api.Calls
                      #end
                    </td><td class="number">$api.CallQuota</td><td class="number">
                      #if ($api.BandwidthAlert == true)
                      <span class="alert">$api.Bandwidth</span>
                      #else
                      $api.Bandwidth
                      #end
                    </td><td class="number">$api.BandwidthQuota</td></tr>
                  #foreach ($operation in $api.Operations)
                  <tr><td class="child2 text">Operation: $operation.Name</td><td class="number">
                      #if ($operation.CallsAlert == true)
                      <span class="alert">$operation.Calls</span>
                      #else
                      $operation.Calls
                      #end
                    </td><td class="number">$operation.CallQuota</td><td class="number">
                      #if ($operation.BandwidthAlert == true)
                      <span class="alert">$operation.Bandwidth</span>
                      #else
                      $operation.Bandwidth
                      #end
                    </td><td class="number">$operation.BandwidthQuota</td></tr>
                  #end
                  #end
                </tbody>
          </table>
        </p>
        <p>Thank you,</p>
        <p>$OrganizationName API Team</p>
        <a href="$DevPortalUrl">$DevPortalUrl</a>
        <p />
      </body>
    </html>
  HTML
  ), "\n", "\r\n")
}

resource "azurerm_api_management_email_template" "reject_developer" {
  api_management_name = local.apim_name
  resource_group_name = local.resource_group_name
  template_name       = "RejectDeveloperNotificationMessage"
  subject             = "Your subscription request for the $ProdName"
  body = replace(chomp(<<-HTML
    <!DOCTYPE html >
    <html>
      <head />
      <body>
        <p style="font-size:12pt;font-family:'Segoe UI'">Dear $DevFirstName $DevLastName,</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">
              We would like to inform you that we reviewed your subscription request for the <strong>$ProdName</strong>.
            </p>
            #if ($SubDeclineReason == "")
            <p style="font-size:12pt;font-family:'Segoe UI'">Regretfully, we were unable to approve it, as subscriptions are temporarily suspended at this time.</p>
            #else
            <p style="font-size:12pt;font-family:'Segoe UI'">
              Regretfully, we were unable to approve it at this time for the following reason:
              <div style="margin-left: 1.5em;"> $SubDeclineReason </div></p>
            #end
            <p style="font-size:12pt;font-family:'Segoe UI'"> We truly appreciate your interest. </p><p style="font-size:12pt;font-family:'Segoe UI'">All the best,</p><p style="font-size:12pt;font-family:'Segoe UI'">The $OrganizationName API Team</p><a style="font-size:12pt;font-family:'Segoe UI'" href="http://$DevPortalUrl">$DevPortalUrl</a></body>
    </html>
  HTML
  ), "\n", "\r\n")
}

resource "azurerm_api_management_email_template" "request_developer" {
  api_management_name = local.apim_name
  resource_group_name = local.resource_group_name
  template_name       = "RequestDeveloperNotificationMessage"
  subject             = "Your subscription request for the $ProdName"
  body = replace(chomp(<<-HTML
    <!DOCTYPE html >
    <html>
      <head />
      <body>
        <p style="font-size:12pt;font-family:'Segoe UI'">Dear $DevFirstName $DevLastName,</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">
              Thank you for your interest in our <strong>$ProdName</strong> API product!
            </p>
        <p style="font-size:12pt;font-family:'Segoe UI'">
              We were delighted to receive your subscription request. We will promptly review it and get back to you at <strong>$DevEmail</strong>.
            </p>
        <p style="font-size:12pt;font-family:'Segoe UI'">Thank you,</p>
        <p style="font-size:12pt;font-family:'Segoe UI'">The $OrganizationName API Team</p>
        <a style="font-size:12pt;font-family:'Segoe UI'" href="http://$DevPortalUrl">$DevPortalUrl</a>
      </body>
    </html>
  HTML
  ), "\n", "\r\n")
}
