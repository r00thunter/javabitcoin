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


							<li class="hidden"><a href="#settings" data-toggle="tab"><span class="glyphicon glyphicon-cog"></span> Settings</a></li>
							<li class="hidden"><a href="#fees" data-toggle="tab"><span class="glyphicon glyphicon-tag"></span> Fees</a></li>
						</ul>
					</div>
				</div>
			</div>

					<div class="tab-pane tab-content" id="about">
						<h2>About <small>Decentralized bitcoin wallet</small></h2>
						<p>Version 1.4</p>
						<p>Compatible with bitcoin core</p>
						<p>API <a href="https://github.com/OutCast3k/coinbin/">https://github.com/OutCast3k/coinbin/</a></p>
						<h3>What is Bitcoin?</h3>
						<p>Bitcoin is a type of digital currency in which encryption techniques are used to regulate the generation of units of currency and verify the transfer of funds, operating independently of a central bank. See <a href="http://www.weusecoins.com/" target="_blank">weusecoins.com</a> for more information.</p>
						<p>If you are looking to buy some Bitcoin try <a href="https://localbitcoins.com/?ch=173j" target="_blank">unicrypto</a>.</p>
						<h3>Information</h3>
						<p>Unicrypto is a free and Decentralized Bitcoin web App</p>
						<h3>Privacy</h3>
						<p>Unicrypto believes strongly in privacy, not only do we support the use of TOR, the site does not collect and store IP or transaction data via our servers nor do we store your bitcoins private key. We do route traffic via cloudflare using an SSL certificate.</p>
						<h3>Donate</h3>
						<p>Please donate 0.005 BTC to <a href="https://www.blockchain.com/btc/payment_request?address=16MXZkbLtdJxPcCKp5jVNuUA5MJZZTuw66&amount=0.005">16MXZkbLtdJxPcCKp5jVNuUA5MJZZTuw66</a> if you found this project useful or want to see more features!</p>
					</div>

	<div class="hidden" id="entropybucket"></div>
	</body>
</html>
