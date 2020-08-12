class LeadsController < ApplicationController 
    require 'zendesk_api'
    require 'sendgrid-ruby'
	include SendGrid
	require 'json'
	require 'uri'
	require 'net/http'
	require 'openssl'
    def create 
        client = DropboxApi::Client.new(ENV["DROPBOX_ACCESS_TOKEN"])
        @lead = Lead.new
        
        
        #put the file in the db if the current user is not a customer else it put it in dropbox
		#check if the file has nudity before ! if yes it dosen't save in the db/dropbox and sent a legal email
        if params[:attachment] != nil
            file_content = params[:attachment].read
            file_name = params[:attachment].original_filename
			file_path = "/rocket_elevator_client/#{params[:company]}/#{file_name}"
			
			File.open(Rails.root.join("public", file_name), 'wb') do |file|
				file.write(file_content)
			end
			
			url_to_verify = "https://rockettothesky.com/" + file_name

			url = URI("https://nuditysearch.p.rapidapi.com/nuditySearch/image")

			http = Net::HTTP.new(url.host, url.port)
			http.use_ssl = true
			http.verify_mode = OpenSSL::SSL::VERIFY_NONE

			request = Net::HTTP::Post.new(url)
			request["x-rapidapi-host"] = 'nuditysearch.p.rapidapi.com'
			request["x-rapidapi-key"] = "#{ENV["NUDITY_API"]}"
			request["content-type"] = 'application/x-www-form-urlencoded'
			request.body = "setting=3&objecturl=#{url_to_verify}"
			response = http.request(request)
			res = JSON.parse(response.read_body)
			File.open(Rails.root.join('public', file_name), 'wb') do |file|
				File.delete(file)
			end  
			if res["classification"] == "NUDITY"

				from = Email.new(email: 'olivier.godbout12@gmail.com')
				to = Email.new(email: "#{params[:email]}")
				subject = "Warning of legal action!"
				content = Content.new(type: 'text/html', value: "<html data-editor-version='2' class='sg-campaigns' xmlns='http://www.w3.org/1999/xhtml'><head>
					<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
					<meta name='viewport' content='width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1'>
					<meta http-equiv='X-UA-Compatible' content='IE=Edge'>
					<style type='text/css'>
				  body, p, div {
					font-family: courier, arial;
					font-size: 15px;
				  }
				  body {
					color: #FFFFFF;
				  }
				  body a {
					color: #ED2939;
					text-decoration: none;
				  }
				  p { margin: 0; padding: 0; }
				  table.wrapper {
					width:100% !important;
					table-layout: fixed;
					-webkit-font-smoothing: antialiased;
					-webkit-text-size-adjust: 100%;
					-moz-text-size-adjust: 100%;
					-ms-text-size-adjust: 100%;
				  }
				  img.max-width {
					max-width: 100% !important;
				  }
				  .column.of-2 {
					width: 50%;
				  }
				  .column.of-3 {
					width: 33.333%;
				  }
				  .column.of-4 {
					width: 25%;
				  }
				  @media screen and (max-width:480px) {
					.preheader .rightColumnContent,
					.footer .rightColumnContent {
					  text-align: left !important;
					}
					.preheader .rightColumnContent div,
					.preheader .rightColumnContent span,
					.footer .rightColumnContent div,
					.footer .rightColumnContent span {
					  text-align: left !important;
					}
					.preheader .rightColumnContent,
					.preheader .leftColumnContent {
					  font-size: 80% !important;
					  padding: 5px 0;
					}
					table.wrapper-mobile {
					  width: 100% !important;
					  table-layout: fixed;
					}
					img.max-width {
					  height: auto !important;
					  max-width: 100% !important;
					}
					a.bulletproof-button {
					  display: block !important;
					  width: auto !important;
					  font-size: 80%;
					  padding-left: 0 !important;
					  padding-right: 0 !important;
					}
					.columns {
					  width: 100% !important;
					}
					.column {
					  display: block !important;
					  width: 100% !important;
					  padding-left: 0 !important;
					  padding-right: 0 !important;
					  margin-left: 0 !important;
					  margin-right: 0 !important;
					}
				  }
				</style>
					<!--user entered Head Start-->
				   <!--End Head user entered-->
				  </head>
				  <body>
					<center class='wrapper' data-link-color='#ED2939' data-body-style='font-size:16px; font-family:courier, monospace; color:#FFFFFF; background-color:#f2f4fb;'>
					  <div class='webkit'>
						<table cellpadding='0' cellspacing='0' border='0' width='100%' class='wrapper' bgcolor='#F2F4FB'>
						  <tbody><tr>
							<td valign='top' bgcolor='#F2F4FB' width='100%'>
							  <table width='100%' role='content-container' class='outer' align='center' cellpadding='0' cellspacing='0' border='0'>
								<tbody><tr>
								  <td width='100%'>
									<table width='100%' cellpadding='0' cellspacing='0' border='0'>
									  <tbody><tr>
										<td>
										  <!--[if mso]>
				  <center>
				  <table><tr><td width='600'>
				<![endif]-->
												  <table width='100%' cellpadding='0' cellspacing='0' border='0' style='width:100%; max-width:600px;' align='center'>
													<tbody><tr>
													  <td role='modules-container' style='padding:0px 0px 0px 0px; color:#FFFFFF; text-align:left;' bgcolor='#F2F4FB' width='100%' align='left'><table class='module preheader preheader-hide' role='module' data-type='preheader' border='0' cellpadding='0' cellspacing='0' width='100%' style='display: none !important; mso-hide: all; visibility: hidden; opacity: 0; color: transparent; height: 0; width: 0;'>
				  <tbody>
				</tbody></table><table class='wrapper' role='module' data-type='image' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed;' data-muid='98ndJyAY9BSGjoVqrr6FYx'>
					<tbody><tr>
					  <td style='font-size:6px; line-height:10px; padding:30px 0px 30px 0px;' valign='top' align='left'>
						<img class='max-width' border='0' style='display:block; color:#000000; text-decoration:none; font-family:Helvetica, arial, sans-serif; font-size:16px; max-width:40% !important; width:40%; height:auto !important;' src=http://cdn.mcauto-images-production.sendgrid.net/da72f00c0fa3860d/2ed33d12-5ca5-425f-9d1a-acaa82f30699/1977x702.png alt='Off Grid Adventures' width='240' data-responsive='true' data-proportionally-constrained='false'>
					  </td>
					</tr>
				  </tbody></table><table class='module' role='module' data-type='text' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed;' data-muid='7pyDCmyDaGcm5WsBBSaEgv'>
					<tbody><tr>
					  <td style='background-color:#ed2939; padding:30px 0px 5px 0px; line-height:22px; text-align:inherit;' height='100%' valign='top' bgcolor='#ED2939'><div><div style='font-family: inherit; text-align: center;'><span style='font-size: 24px'>Cease & Desist</span></div><div></div></div></td>
					</tr>
				  </tbody></table><table class='module' role='module' data-type='text' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed;' data-muid='nSVYnVzPLnGZ4wUdynLiKo'>
					<tbody><tr>
					  <td style='background-color:#ed2939; padding:30px 50px 20px 50px; line-height:22px; text-align:inherit;' height='100%' valign='top' bgcolor='#ED2939'><div><div style='font-family: inherit; text-align: left'>Hello #{params[:name]}, the image you sent to us is highly offensive and constitutes harrasment against Rocket Elevator employees. We ask you to refrain from sending any illicit images in the future or we will be forced to pursue legal action.</div>
				<div style='font-family: inherit; text-align: center'>&nbsp;</div>
				<div style='font-family: inherit; text-align: left'>
				Any further attempts to send lewd images will result in us pursuing legal action against you.<br><br>
				</div>
				<div style='font-family: inherit; text-align: center'>&nbsp;</div>
				<div style='font-family: inherit; text-align: left'>The Rocket Team</div><div></div></div></td>
					</tr>
				  </tbody></table>
					<table class='wrapper' role='module' data-type='image' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed;' data-muid='3Ypdby9Xfsf2rN27zTDEfN'>
					<tbody><tr>
					  <td style='font-size:6px; line-height:10px; padding:0px 0px 0px 0px;' valign='top' align='center'>
						<img class='max-width' border='0' style='display:block; color:#000000; text-decoration:none; font-family:Helvetica, arial, sans-serif; font-size:16px; max-width:100% !important; width:100%; height:auto !important;' src=http://cdn.mcauto-images-production.sendgrid.net/da72f00c0fa3860d/f2925c32-e5cf-46bd-8aef-98fda2001803/850x492.jpg alt='' width='600' data-responsive='true' data-proportionally-constrained='false'>
					  </td>
					</tr>
				  </tbody></table>
				  <table class='module' role='module' data-type='spacer' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed;' data-muid='iYySZ4rAB78PLoW7vU13Bb'>
					<tbody><tr>
					  <td style='padding:0px 0px 30px 0px;' role='module-content' bgcolor=''>
					  </td>
					</tr>
				  </tbody></table><table class='module' role='module' data-type='divider' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed;' data-muid='mVyZz43HETwfwb72TGh4iy'>
					<tbody><tr>
					  <td style='padding:0px 0px 0px 0px;' role='module-content' height='100%' valign='top' bgcolor=''>
						<table border='0' cellpadding='0' cellspacing='0' align='center' width='100%' height='3px' style='line-height:3px; font-size:3px;'>
						  <tbody><tr>
							<td style='padding:0px 0px 3px 0px;' bgcolor='#FFFFFF'></td>
						  </tr>
						</tbody></table>
					  </td>
					</tr>
				  </tbody></table><table class='module' role='module' data-type='spacer' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed;' data-muid='sfek66tVLi5d2iy5jmSawj'>
					<tbody><tr>
					  <td style='padding:0px 0px 30px 0px;' role='module-content' bgcolor=''>
					  </td>
					</tr>
				  </tbody></table><table class='module' role='module' data-type='social' align='center' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed;' data-muid='kTqJe3Ke2movtrLxSjKW3C'>
				  </table>
													</tr>
												  </tbody></table>
										</td>
									  </tr>
									</tbody></table>
								  </td>
								</tr>
							  </tbody></table>
							</td>
						  </tr>
						</tbody></table>
						</div>
						</center>
						</body></html>")
				mail = Mail.new(from, subject, to, content)

				sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
				response = sg.client.mail._('send').post(request_body: mail.to_json)
				
			else
				@lead.Full_Name = params[:name]
				@lead.Compagny_Name = params[:company]
				@lead.Email = params[:email]
				@lead.Phone = params[:phone]
				@lead.Project_Name = params[:project]
				@lead.Project_Description = params[:description]
				@lead.Department = params[:department]
				@lead.Message = params[:message]
				        # using SendGrid's Ruby Library
				# https://github.com/sendgrid/sendgrid-ruby
				from = Email.new(email: 'olivier.godbout12@gmail.com')
				to = Email.new(email: "#{params[:email]}")
				subject = "Confirmation about project #{params[:project]}"
				content = Content.new(type: 'text/html', value: "<html data-editor-version='2' class='sg-campaigns' xmlns='http://www.w3.org/1999/xhtml'><head>
					<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
					<meta name='viewport' content='width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1'>
					<meta http-equiv='X-UA-Compatible' content='IE=Edge'>
					<style type='text/css'>
				body, p, div {
					font-family: courier, arial;
					font-size: 15px;
				}
				body {
					color: #FFFFFF;
				}
				body a {
					color: #ed2939;
					text-decoration: none;
				}
				p { margin: 0; padding: 0; }
				table.wrapper {
					width:100% !important;
					table-layout: fixed;
					-webkit-font-smoothing: antialiased;
					-webkit-text-size-adjust: 100%;
					-moz-text-size-adjust: 100%;
					-ms-text-size-adjust: 100%;
				}
				img.max-width {
					max-width: 100% !important;
				}
				.column.of-2 {
					width: 50%;
				}
				.column.of-3 {
					width: 33.333%;
				}
				.column.of-4 {
					width: 25%;
				}
				@media screen and (max-width:480px) {
					.preheader .rightColumnContent,
					.footer .rightColumnContent {
					text-align: left !important;
					}
					.preheader .rightColumnContent div,
					.preheader .rightColumnContent span,
					.footer .rightColumnContent div,
					.footer .rightColumnContent span {
					text-align: left !important;
					}
					.preheader .rightColumnContent,
					.preheader .leftColumnContent {
					font-size: 80% !important;
					padding: 5px 0;
					}
					table.wrapper-mobile {
					width: 100% !important;
					table-layout: fixed;
					}
					img.max-width {
					height: auto !important;
					max-width: 100% !important;
					}
					a.bulletproof-button {
					display: block !important;
					width: auto !important;
					font-size: 80%;
					padding-left: 0 !important;
					padding-right: 0 !important;
					}
					.columns {
					width: 100% !important;
					}
					.column {
					display: block !important;
					width: 100% !important;
					padding-left: 0 !important;
					padding-right: 0 !important;
					margin-left: 0 !important;
					margin-right: 0 !important;
					}
				}
				</style>
					<!--user entered Head Start-->
				
				<!--End Head user entered-->
				</head>
				<body>
					<center class='wrapper' data-link-color='#ed2939' data-body-style='font-size:16px; font-family:courier, monospace; color:#FFFFFF; background-color:#f2f4fb;'>
					<div class='webkit'>
						<table cellpadding='0' cellspacing='0' border='0' width='100%' class='wrapper' bgcolor='#f2f4fb'>
						<tbody><tr>
							<td valign='top' bgcolor='#f2f4fb' width='100%'>
							<table width='100%' role='content-container' class='outer' align='center' cellpadding='0' cellspacing='0' border='0'>
								<tbody><tr>
								<td width='100%'>
									<table width='100%' cellpadding='0' cellspacing='0' border='0'>
									<tbody><tr>
										<td>
										<!--[if mso]>
				<center>
				<table><tr><td width='600'>
				<![endif]-->
												<table width='100%' cellpadding='0' cellspacing='0' border='0' style='width:100%; max-width:600px;' align='center'>
													<tbody><tr>
													<td role='modules-container' style='padding:0px 0px 0px 0px; color:#FFFFFF; text-align:left;' bgcolor='#f2f4fb' width='100%' align='left'><table class='module preheader preheader-hide' role='module' data-type='preheader' border='0' cellpadding='0' cellspacing='0' width='100%' style='display: none !important; mso-hide: all; visibility: hidden; opacity: 0; color: transparent; height: 0; width: 0;'>
				<tbody>
				</tbody></table><table class='wrapper' role='module' data-type='image' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed;' data-muid='98ndJyAY9BSGjoVqrr6FYx'>
					<tbody><tr>
					<td style='font-size:6px; line-height:10px; padding:30px 0px 30px 0px;' valign='top' align='left'>
						<img class='max-width' border='0' style='display:block; color:#000000; text-decoration:none; font-family:Helvetica, arial, sans-serif; font-size:16px; max-width:40% !important; width:40%; height:auto !important;' src=http://cdn.mcauto-images-production.sendgrid.net/da72f00c0fa3860d/2ed33d12-5ca5-425f-9d1a-acaa82f30699/1977x702.png alt='Off Grid Adventures' width='240' data-responsive='true' data-proportionally-constrained='false'>
					</td>
					</tr>
				</tbody></table><table class='module' role='module' data-type='text' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed;' data-muid='7pyDCmyDaGcm5WsBBSaEgv'>
					<tbody><tr>
					<td style='background-color:#ed2939; padding:30px 0px 5px 0px; line-height:22px; text-align:inherit;' height='100%' valign='top' bgcolor='#ed2939'><div><div style='font-family: inherit; text-align: center;'><span style='font-size: 24px'>Thanks for contacting us!</span></div><div></div></div></td>
					</tr>
				</tbody></table><table class='module' role='module' data-type='text' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed;' data-muid='nSVYnVzPLnGZ4wUdynLiKo'>
					<tbody><tr>
					<td style='background-color:#ed2939; padding:30px 50px 20px 50px; line-height:22px; text-align:inherit;' height='100%' valign='top' bgcolor='#ed2939'><div><div style='font-family: inherit; text-align: left'>Hello #{params[:name]}, thank you for contacting Rocket Elevators to discuss the opportunity to contribute to your project #{params[:project]}.</div>
				<div style='font-family: inherit; text-align: center'>&nbsp;</div>
				<div style='font-family: inherit; text-align: left'>
				A representative from our team will be in touch with you very soon. We look forward to demonstrating the value of our solutions and helping you choose the appropriate product given your requirements.<br><br>
				We’ll Talk soon,</div>
				<div style='font-family: inherit; text-align: center'>&nbsp;</div>
				<div style='font-family: inherit; text-align: left'>The Rocket Team</div><div></div></div></td>
					</tr>
				</tbody></table>
					<table class='wrapper' role='module' data-type='image' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed;' data-muid='3Ypdby9Xfsf2rN27zTDEfN'>
					<tbody><tr>
					<td style='font-size:6px; line-height:10px; padding:0px 0px 0px 0px;' valign='top' align='center'>
						<img class='max-width' border='0' style='display:block; color:#000000; text-decoration:none; font-family:Helvetica, arial, sans-serif; font-size:16px; max-width:100% !important; width:100%; height:auto !important;' src=http://cdn.mcauto-images-production.sendgrid.net/da72f00c0fa3860d/e1b55fd8-f4eb-4a73-97d7-6fc47a56ef03/2505x1670.jpeg alt='' width='600' data-responsive='true' data-proportionally-constrained='false'>
					</td>
					</tr>
				</tbody></table>
				<table class='module' role='module' data-type='spacer' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed;' data-muid='iYySZ4rAB78PLoW7vU13Bb'>
					<tbody><tr>
					<td style='padding:0px 0px 30px 0px;' role='module-content' bgcolor=''>
					</td>
					</tr>
				</tbody></table><table class='module' role='module' data-type='divider' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed;' data-muid='mVyZz43HETwfwb72TGh4iy'>
					<tbody><tr>
					<td style='padding:0px 0px 0px 0px;' role='module-content' height='100%' valign='top' bgcolor=''>
						<table border='0' cellpadding='0' cellspacing='0' align='center' width='100%' height='3px' style='line-height:3px; font-size:3px;'>
						<tbody><tr>
							<td style='padding:0px 0px 3px 0px;' bgcolor='#ffffff'></td>
						</tr>
						</tbody></table>
					</td>
					</tr>
				</tbody></table><table class='module' role='module' data-type='spacer' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed;' data-muid='sfek66tVLi5d2iy5jmSawj'>
					<tbody><tr>
					<td style='padding:0px 0px 30px 0px;' role='module-content' bgcolor=''>
					</td>
					</tr>
				</tbody></table><table class='module' role='module' data-type='social' align='center' border='0' cellpadding='0' cellspacing='0' width='100%' style='table-layout: fixed;' data-muid='kTqJe3Ke2movtrLxSjKW3C'>
				</table>
													</tr>
												</tbody></table>
										</td>
									</tr>
									</tbody></table>
								</td>
								</tr>
							</tbody></table>
							</td>
						</tr>
						</tbody></table>
						</div>
						</center>
						</body></html>")
				mail = Mail.new(from, subject, to, content)

				sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
				response = sg.client.mail._('send').post(request_body: mail.to_json)

				ZendeskAPI::Ticket.create!($client, :type => "question", :subject => " #{params[:name]} from #{params[:company]}", :comment => { :value => "
					The contact #{params[:name]} from company #{params[:company]} can be reached at email  #{params[:email]} and at 
					phone number #{params[:phone]}. #{params[:department]} has a project named #{params[:project]} which would require contribution from Rocket 
					Elevators. 
					#{params[:description]}
					Attached Message: #{params[:message]}
					The Contact uploaded an attachment" }, :priority => "urgent") 



				begin
					if Customer.find_by(user_id:current_user.id) != nil
						
						client.upload(file_path, file_content)
						begin  
							shared_link_url = client.create_shared_link_with_settings(file_path).url
						rescue => exception
							shared_link_url = client.list_shared_links(options = {:path => file_path}).links[0].url
						end
						@lead.File_name = shared_link_url
					else
						@lead.File_Data = file_content
						@lead.File_name = file_name
					end
				rescue => exception
					@lead.File_Data = file_content
					@lead.File_name = file_name
				end
				@lead.save!
			end
		else
			@lead.Full_Name = params[:name]
			@lead.Compagny_Name = params[:company]
			@lead.Email = params[:email]
			@lead.Phone = params[:phone]
			@lead.Project_Name = params[:project]
			@lead.Project_Description = params[:description]
			@lead.Department = params[:department]
			@lead.Message = params[:message]
			@lead.save!
		end        
        redirect_to "/thankyou"
    end  
end