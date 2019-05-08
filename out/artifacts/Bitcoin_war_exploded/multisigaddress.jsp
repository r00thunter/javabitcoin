<!DOCTYPE html> 
<html lang="en">
	<head>

		<title>Unicrypto : Bitcoin Wallet</title>
		<link rel="icon" href="images/favicon.png" type="images/png" sizes="16x16">

		<link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
		<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
		<link rel="stylesheet" href="css/style.css" media="screen">
		
		<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="js/moment.min.js"></script>
		<script type="text/javascript" src="js/transition.js"></script>
		<script type="text/javascript" src="js/collapse.js"></script>

		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>

		<script type="text/javascript" src="js/crypto-min.js"></script>
		<script type="text/javascript" src="js/crypto-sha256.js"></script>
		<script type="text/javascript" src="js/crypto-sha256-hmac.js"></script>
		<script type="text/javascript" src="js/sha512.js"></script>
		<script type="text/javascript" src="js/ripemd160.js"></script>
		<script type="text/javascript" src="js/aes.js"></script>

		<script type="text/javascript" src="js/qrcode.js"></script>
		<script type="text/javascript" src="js/qcode-decoder.min.js"></script>
		<script type="text/javascript" src="js/jsbn.js"></script>
		<script type="text/javascript" src="js/ellipticcurve.js"></script>

		<script type="text/javascript" src="js/coin.js"></script>
		<script type="text/javascript" src="js/coinbin.js"></script>
	</head>

	<body>
		<div id="wrap">
			<!-- Fixed navbar -->
			<div id="header" class="navbar navbar-default " role="navigation">
				<div class="navbar-header">
					<a href="/Bitcoin_war_exploded/home.jsp" class="glyphicon glyphicon-ok"><img src="images/navlogo.png" style="height:25px;margin-top:+15px"></a>
				</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav">
							<li class="dropdown">
								<a href="" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-plus"></span> BrainWallet<b class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><a href="/Bitcoin_war_exploded/brainwallet.jsp">Address</a></li>
									<li><a href="/Bitcoin_war_exploded/newsegwit.jsp" >SegWit Address</a></li>
									<li><a href="/Bitcoin_war_exploded/mutisigaddress.jsp">MultiSig Address</a></li>
									<li class="divider"></li>
									<li><a href="/Bitcoin_war_exploded/newTransaction">Transaction</a></li>
								</ul>
							</li>
							<li><a href="/Bitcoin_war_exploded/verify.jsp"><span class="glyphicon glyphicon-ok"></span> Verify</a></li>
							<li><a href="/Bitcoin_war_exploded/sign.jsp"><span class="glyphicon glyphicon-pencil"></span> Sign</a></li>
							<li><a href="/Bitcoin_war_exploded/broadcast.jsp"><span class="glyphicon glyphicon-globe"></span> Broadcast</a></li>
							<li><a href="/Bitcoin_war_exploded/wallet.jsp"><span class="glyphicon glyphicon-briefcase"></span> Wallet</a></li>
							<li><a href="/Bitcoin_war_exploded/about.jsp"><span class="glyphicon glyphicon-info-sign"></span> About</a></li>
							<%
								if(session.getAttribute("login")==null || session.getAttribute("login")==" ") //check condition unauthorize user not direct access welcome.jsp page
								{
									response.sendRedirect("signup.jsp");
								}
							%>
							<li><a href="/Bitcoin_war_exploded/profile.jsp"><%=session.getAttribute("login")%> </a></li>
							<li><a href="/Bitcoin_war_exploded/logout.jsp">Logout</a></li>


							<li class="hidden"><a href="#settings" data-toggle="tab"><span class="glyphicon glyphicon-cog"></span> Settings</a></li>
							<li class="hidden"><a href="#fees" data-toggle="tab"><span class="glyphicon glyphicon-tag"></span> Fees</a></li>
						</ul>
					</div>
				</div>
			</div>
					<div class="tab-pane tab-content" id="newMultiSig">
						<h2>New Multisig Address <small>Secure multisig address</small></h2>

						<div class="row">

							<div class="col-md-8">
								<p>Public keys can be <a href="#newAddress">generated in your browser</a> or from your bitcoin client</a>.</p>
								<p>Enter the public keys of all the participants, to create a <a href="https://en.bitcoin.it/wiki/Address#Multi-signature_addresses" target="_blank">multi signature address</a>. Maximum of 15 allowed. Compressed and uncompressed public keys are accepted.</p>
							</div>

							<div class="col-md-3">
								<p class="alert alert-info"><span class="glyphicon glyphicon-info-sign"></span> <a href="javascript:;" data-toggle="modal" data-target="#modalMediator"><abbr>Need a Mediator?</abbr></a></p>
							</div>

							<div class="col-md-1">
							</div>
						</div>

						<div id="multisigPubKeys" class="row">
							<div class="form-horizontal">
								<div class="col-xs-11">
									<input type="text" class="form-control pubkey">
								</div>
								<a href="javascript:;" class="pubkeyAdd"><span class="glyphicon glyphicon-plus"></span></a>
								<br><br>
							</div>
						</div>

						<p>Enter the amount of signatures required to release the coins</p>
						<div class="row">
							<div class="col-xs-3">
								<select id="releaseCoins" class="form-control">
									<option>1</option>
									<option selected>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
									<option>9</option>
									<option>10</option>
									<option>11</option>
									<option>12</option>
									<option>13</option>
									<option>14</option>
									<option>15</option>
								</select>
							</div>
						</div>

						<br>

						<div id="multiSigErrorMsg" class="alert alert-danger" style="display:none;"></div>

						<div class="alert alert-success hidden" id="multiSigData">
							<label>Address</label>
							<p>Payment should be made to this address:</p>
							<div class="row">
								<div class="col-lg-6">
									<div class="input-group">
										<input type="text" class="form-control address" value="" readonly>
										<span class="input-group-btn">
											<button class="qrcodeBtn btn btn-default" type="button" data-toggle="modal" data-target="#modalQrcode"><span class="glyphicon glyphicon-qrcode"></span></button>
										</span>
									</div>
								</div>
							</div>
							<label>Redeem Script</label>
							<p>This script should be <i>saved and should be shared with all the participants before a payment is made</i>, so they may validate the authenticity of the address, it will also be used later to release the bitcoins.</p>
							<textarea class="form-control script" style="height:160px" readonly></textarea>
							<label>Shareable URL</label>
							<input type="text" class="scriptUrl form-control" readonly>
						</div>

						<input type="button" class="btn btn-primary" value="Submit" id="newMultiSigAddress">
						<br>
					</div>
	<div class="hidden" id="entropybucket"></div>
	</body>
</html>
