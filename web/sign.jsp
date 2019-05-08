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
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a href="/Bitcoin_war_exploded/home.jsp" class="navbar-brand" id="homeBtn"><img src="images/navlogo.png" style="height:25px;margin-top:-5px"></a>
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
					<div class="tab-pane tab-content" id="sign">
						<h2>Sign Transaction <small>once a transaction has been verified</small></h2>
						<p>Once you have <a href="#verify">verified</a> a transaction you can sign and then <a href="#broadcast">broadcast</a> it into the network.</p>

						<div class="row">
							<div class="col-md-12">
								<label for="signPrivateKey">Private key</label>

								<div class="input-group">
									<input id="signPrivateKey" type="password" class="form-control" value="">
									<span class="input-group-btn">
										<button class="showKey btn btn-default" type="button">Show</button>
									</span>
								</div>
							</div>
						</div>
						<br>

						<div class="row">
							<div class="col-md-12">
								<textarea type="text" id="signTransaction" class="form-control" style="height:125px"></textarea>
							</div>
						</div>
						<br>

						<a href="javascript:;" id="signAdvancedCollapse">
							<div class="well well-sm"><span class="glyphicon glyphicon-collapse-down"></span> Advanced Options</div>
						</a>

						<div id="signAdvanced" class="hidden">
							<div class="row">
								<div class="col-md-12">
									<label for="sighashType">Sig Hash Type</label>

									<select id="sighashType" class="form-control">
										<option value="1" rel="SIGHASH_ALL: Signs all the inputs and outputs, protecting everything against modification.">ALL (default)</option>
										<option value="2" rel="SIGHASH_NONE: Signs all of the inputs but none of the outputs, allowing anyone to change where the satoshis are going unless other signatures using other signature hash flags protect the outputs.">NONE</option>
										<option value="3" rel="SIGHASH_SINGLE: The only output signed is the one corresponding to this input, ensuring nobody can change your part of the transaction but allowing other signers to change their part of the transaction.">SINGLE</option>
										<option value="129" rel="SIGHASH_ALL|SIGHASH_ANYONECANPAY: Signs all of the outputs but only this one input, it allows anyone to add or remove other inputs, so anyone can contribute additional satoshis but they cannot change how many satoshis are sent nor where they go.">ALL|ANYONECANPAY</option>
										<option value="130" rel="SIGHASH_NONE|SIGHASH_ANYONECANPAY: Signs only this one input and allows anyone to add or remove other inputs or outputs, so anyone who gets a copy of this input can spend it however they'd like.">NONE|ANYONECANPAY</option>
										<option value="131" rel="SIGHASH_SINGLE|SIGHASH_ANYONECANPAY: Signs this one input and its corresponding output. Allows anyone to add or remove other inputs.">SINGLE|ANYONECANPAY</option>
									</select>
								</div>
							</div>

							<br>

							<div class="alert alert-info" id="sighashTypeInfo">
								SIGHASH_ALL: The default, signs all the inputs and outputs, protecting everything except the signature scripts against modification.
							</div>
						</div>

						<div class="alert alert-danger hidden" id="signedDataError">
							<span class="glyphicon glyphicon-exclamation-sign"></span> There is a problem with one or more of your inputs, please check and try again
						</div>

						<div class="alert alert-success hidden" id="signedData">
							<label>Signed transaction</label>
							<button class="qrcodeBtn btn btn-default" type="button" data-toggle="modal" data-target="#modalQrcode" style="float:right;"><span class="glyphicon glyphicon-qrcode"></span></button>
							<p>The above transaction has been signed:</p>

                        				<textarea class="form-control script" style="height:160px" readonly></textarea>
                                    
							<p class="text-muted">Size: <span class="txSize">0</span> <i>bytes</i></p>
						</div>

						<input type="button" value="Submit" class="btn btn-primary" id="signBtn">
						<br>
					</div>
	<div class="hidden" id="entropybucket"></div>
	</body>
</html>
