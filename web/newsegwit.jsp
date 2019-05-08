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
				<div class="container">
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


					<div class="tab-pane tab-content" id="newSegWit">
						<h2>New SegWit Address <small> Smaller &amp; Faster Transactions</small></h2>

						<p>Any keys used you will need to manually store safely as they will be needed later to redeem the bitcoins.</p>

						<label>SegWit Address (Share)</label>

						<div class="input-group">
							<input id="newSegWitAddress" type="text" class="form-control address" value="" readonly>
							<span class="input-group-btn">
								<button class="qrcodeBtn btn btn-default" type="button" data-toggle="modal" data-target="#modalQrcode"><span class="glyphicon glyphicon-qrcode"></span></button>
							</span>
						</div>

						<label>RedeemScript</label>
						<input id="newSegWitRedeemScript" type="text" class="form-control" readonly>

						<label>Public key</label>
						<input id="newSegWitPubKey" type="text" class="form-control" readonly>

						<label>Private key (WIF key)</label>
						<div class="input-group">
							<input id="newSegWitPrivKey" type="password" class="form-control" value="" readonly>
							<span class="input-group-btn">
								<button class="showKey btn btn-default" type="button">Show</button>
							</span>
						</div>


						<h3>Address Options</h3>
						<p>You can use the advanced options below to generate different kind of keys and addresses.</p>

						<div class="checkbox">
							<label><input type="checkbox" id="newSegWitBech32addr" class="checkbox-inline" checked> Enable <a href="https://en.bitcoin.it/wiki/Bech32" target="_blank">Bech32</a>?</label>
						</div>

						<div class="checkbox">
							<label><input type="checkbox" id="newSegWitBrainwallet" class="checkbox-inline"> Custom Seed or Brain Wallet</label>
							<input type="text" class="form-control hidden" id="brainwalletSegWit">
						</div>

						<input type="button" class="btn btn-primary" value="Generate" id="newSegWitKeysBtn">
						<br>
					</div>

	<div class="hidden" id="entropybucket"></div>
	</body>
</html>
