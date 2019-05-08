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
					<div class="tab-pane tab-content" id="wallet">
						<div class="row">
							<div class="col-md-12">
								<h2>Open Wallet <small> browser based bitcoin wallet</small></h2>
								<div id="openLogin">
									<form class="form-signin" role="form" action="javascript:;">

										<p>Use the form below to open a wallet and begin using this service.</p>

										<div class="alert alert-warning">
											<b>Notice</b>: Different email address and password combination will open different wallets, be careful when entering your details as lost accounts can not be recovered! 
										</div>

										<input id="openEmail" type="email" class="form-control" placeholder="Email address" required autofocus>
										<input id="openPass" type="password" class="form-control" placeholder="Password" required>
										<input id="openPassConfirm" type="password" class="form-control" placeholder="Password confirm" required>
										<br>

										<div>
											<a href="javascript:;" class="optionsCollapse"><div class="well well-sm"><span class="glyphicon glyphicon-collapse-down" id="glyphcollapse"></span> Advanced Options</div></a>
											<div class="hidden optionsAdvanced">
												<label>Segregated Witness Address</label>
												<p class="checkbox">
													<label><input type="checkbox" id="walletSegwit" class="checkbox-inline" checked> Use a segwit address instead of a regular address. <span class="text-muted"><i>(recommended)</i></span></label></label> <br>
													<label><input type="radio" id="walletSegwitp2sh" class="walletSegwitType" name="walletSegWitType" value="p2sh" checked> p2sh address</label> <br>
													<label><input type="radio" id="walletSegwitBech32" class="walletSegwitType" name="walletSegWitType" value="bech32"> bech32 address</label>
												</p>

												<label>Enable Replace by Fee (RBF)</label>
												<p class="checkbox">
													<label><input type="checkbox" id="walletRBF" class="checkbox-inline" checked> Enable RBF on all transactions, allowing you to manually raise the transaction fee later if required. <span class="text-muted"><i>(recommended)</i></span></label></label>
												</p>
											</div>
										</div>

										<div id="openLoginStatus" class="alert alert-danger hidden"></div>
										<button id="openBtn" class="btn btn-primary" type="submit">Submit</button>
									</form>
								</div>

								<div id="openWallet" class="hidden">
									<div class="row">

										<div class="col-md-12" align="center">
											<div id="walletQrCode"></div> <br>
											<div>
												<span id="walletLoader" class="hidden"><img src="images/loader.gif"></span>
												<span id="walletAddress"></span> 

												<div class="btn-group">
													<button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown" id="walletToBtn">SegWit <span class="caret"></span></button>
													<ul class="dropdown-menu">
														<li><a href="javascript:;" id="walletToSegWit">SegWit</a></li>
														<li><a href="javascript:;" id="walletToSegWitBech32">SegWit/Bech32</a></li>
														<li><a href="javascript:;" id="walletToLegacy">Legacy</a></li>
													</ul>
												</div>
											</div>
											<br>
											<div style="text-align:center; width:350px;">
												<ul class="nav nav-pills" role="tablist">
													<li role="presentation" class="active"><a href="javascript:;" id="walletBalance">0.00 BTC</a></li>
													<li role="presentation"><a href="javascript:;" id="walletShowSpend">Spend</a></li>
													<li role="presentation"><a id="walletHistory" href="javascript:;" target="_blank">BlockExplore</a></li>
													<li role="presentation"><a href="https://buy.bitcoin.com/" target="_blank">Buy</a></li>
													<li role="presentation"><a href="javascript:;" id="walletShowKeys">Keys</a></li>
												</ul>

												<br>

												<div id="walletKeys" class="hidden">
													<label>Public Key</label>
													<input class="form-control pubkey" type="text" readonly>

													<div class="walletSegWitRS hidden">
														<label>Redeem Script <i>(SegWit)</i></label>
														<input class="form-control" type="text" readonly>
													</div>

													<label>Private key</label>
													<div class="input-group">
														<input class="form-control privkey" type="password" readonly>

														<span class="input-group-btn">
															<button class="showKey btn btn-default" type="button">Show</button>
														</span>
													</div>

													<label>Private Key (AES256 encrypted key)</label>
													<input class="form-control privkeyaes" type="text" readonly>
												</div>

												<div id="walletSpend" class="hidden">
													<div class="row">
														<div class="form-inline output">
															<div class="col-xs-8">
																<label>Address</label>
															</div>

															<div class="col-xs-3">
																<label>Amount</label>
															</div>
														</div>
													</div>

													<div class="row" id="walletSpendTo">
														<div class="form-horizontal output">
															<div class="col-xs-8">
																<input type="text" class="form-control addressTo" data-original-title="" title="">
															</div>
															<div class="col-xs-3">
																<input type="text" class="form-control amount" data-original-title="" title="" placeholder="0.00">

															</div>

															<a href="javascript:;" class="addressAdd"><span class="glyphicon glyphicon-plus"></span></a>
															<br><br>
														</div>
													</div>
													<div class="row">
														<div class="col-xs-6">
															<label><abbr title="the amount to pay in network miner fee">Transaction Fee</abbr>&nbsp;&nbsp;<a href="javascript:;" id="feesestwallet"><span class="glyphicon glyphicon-question-sign"></span></a></label>
															<input type="text" class="form-control" value="0.00004000" id="txFee">
														</div>
														<div class="col-xs-5">
															<label><abbr title="the amount to donate to coinb.in">Donation</abbr></label>
															<input type="text" class="form-control" value="0.003" id="developerDonation">
														</div>
													</div>
													<br>

													<div id="walletSendStatus" class="alert alert-danger hidden"></div>

													<button class="btn btn-primary" type="button" id="walletSendBtn">Send</button>
													<button class="btn btn-default" type="button">Reset</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

	<div class="hidden" id="entropybucket"></div>
	</body>
</html>
