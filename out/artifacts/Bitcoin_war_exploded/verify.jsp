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
					<div class="tab-pane tab-content" id="verify">
						<h2>Verify <small>transactions and other scripts</small></h2>
						<div class="row">
							<div class="col-md-12">
								<p>Enter the raw transaction, redeem script, pubkey, hd address or wif key to convert it into a readable format that can be verified manually.</p>
								<textarea type="text" id="verifyScript" class="form-control" style="height:125px"></textarea>
							</div>
						</div>
						<br>

						<div class="hidden verifyData" id="verifyRsData">

							<h4>Redeem Script</h4>
							<p><span style="float:right"><a href="javascript:;" target="_blank" class="verifyLink" title="Link to this page"><span class="glyphicon glyphicon-link"></span></a></span>The above redeem script has been decoded</p>

							<div class="hidden" id="verifyRsDataMultisig">
								<label>Multi Signature Address</label>
								<div class="row">
    									<div class="col-lg-6">
    										<div class="input-group">
    											<input type="text" class="form-control address multisigAddress" value="" readonly>
    											<span class="input-group-btn">
    												<button class="qrcodeBtn btn btn-default" type="button" data-toggle="modal" data-target="#modalQrcode"><span class="glyphicon glyphicon-qrcode"></span></button>
    											</span>
    										</div>
    									</div>
    								</div>

								<label>Required Signatures</label>
		    						<p class="signaturesRequired">?</p>
    								<label>Signatures Required from</label>
    								<table class="table table-striped table-hover">
    									<tbody>
    									</tbody>
    								</table>
								<br>
							</div>
	
							<div class="hidden verifyData" id="verifyRsDataSegWit">
				                               	<label>Segwit Address</label>
   								<div class="row">
   									<div class="col-lg-6">
    										<div class="input-group">
    											<input type="text" class="form-control address segWitAddress" value="" readonly>
    											<span class="input-group-btn">
    												<button class="qrcodeBtn btn btn-default" type="button" data-toggle="modal" data-target="#modalQrcode"><span class="glyphicon glyphicon-qrcode"></span></button>
    											</span>
    										</div>
									</div>
								</div>
								<br>
							</div>

							<div class="hidden verifyData" id="verifyRsDataHodl">
								<label>Hodl Address</label>
								<div class="row">
									<div class="col-md-12">
										<div class="input-group">
											<input type="text" class="form-control address" value="" readonly>
											<span class="input-group-btn">
												<button class="qrcodeBtn btn btn-default" type="button" data-toggle="modal" data-target="#modalQrcode"><span class="glyphicon glyphicon-qrcode"></span></button>
											</span>
										</div>
									</div>
								</div>

								<label>Required Signature</label>
								<div class="row">
									<div class="col-md-12">
										<div class="input-group">
											<input type="text" class="form-control address pubkey" value="" readonly>
											<span class="input-group-btn">
												<button class="qrcodeBtn btn btn-default" type="button" data-toggle="modal" data-target="#modalQrcode"><span class="glyphicon glyphicon-qrcode"></span></button>
											</span>
										</div>
									</div>
								</div>

								<label>Unlock Time</label>
								<div class="row">
									<div class='col-md-4'>
										<div class="input-group">
											<input type="text" class="form-control date" value="" readonly>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="hidden verifyData" id="verifyTransactionData">
							<h4>Transaction Script</h4>
							<p><span style="float:right"><a href="" target="_blank" class="verifyLink" title="Link to this page"><span class="glyphicon glyphicon-link"></span></a></span>The above script has been decoded</p>
							<div><b>Version</b>: <span class="transactionVersion"></span></div>
							<div><b>Transaction Size</b>: <span class="transactionSize"></span></div>
							<div><b>Lock time</b>: <span class="transactionLockTime"></span></div>
							<div class="transactionSegWit"><b>SegWit</b>: True</div>
							<div class="transactionRBF"><b>RBF</b>: This is a <a href="https://en.bitcoin.it/wiki/Transaction_replacement">replace by fee</a> transaction!</div>

							<hr>

							<label>Inputs</label>
							<table class="table table-striped table-hover ins">
								<thead>
									<tr style="font-weight:bold;">
										<td><abbr title="the transaction id">Txid</abbr></td><td><abbr title="index id of the the transaction">N</abbr></td><td><abbr title="transaction script">Script</abbr></td><td><abbr title="is input signed?">Signed?</abbr></td><td><abbr title="is transaction a multisig transaction?">MultiSig?</abbr></td>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>

							<label>Outputs</label>
							<table class="table table-striped table-hover outs">
								<thead>
									<tr style="font-weight:bold;">
										<td><abbr title="address the funds are being sent to">Address</abbr></td><td><abbr title="the amount the address is being sent">Amount</abbr></td><td><abbr title="the script of the transaction">Script</abbr></td>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>


						<div class="hidden verifyData" id="verifyPrivKey">
							<h4>WIF key</h4>
							<p>The above wif key has been decoded</p>
							<p><b>Address</b>: <input type="text" class="form-control address" readonly></p>
							<p><b>Public key</b>: <input type="text" class="form-control pubkey" readonly></p>
							<p><b>Private key</b>: <input type="text" class="form-control privkey" readonly></p>
							<p><b>Is compressed</b>: <span class="iscompressed"></span></p>

						</div>

						<div class="hidden verifyData" id="verifyPubKey">
							<h4>Public key</h4>
							<p><span style="float:right"><a href="" target="_blank" class="verifyLink" title="Link to this page"><span class="glyphicon glyphicon-link"></span></a></span>The above public key has been encoded to its address</p>
							<p><b>Legacy Address</b>: <input type="text" class="form-control address" readonly></p>

							<div class="hidden verifyDataSw">
								<hr>
								<div class="row">
									<div class="col-md-6">
										<p><b>P2SH Segwit Address</b>: <input type="text" class="form-control addressSegWit" readonly></p>
									</div>

									<div class="col-md-6">
										<p><b>P2SH Segwit Redeem Script</b>: <input type="text" class="form-control addressSegWitRedeemScript" readonly></p>
									</div>
								</div>

								<hr>
								<div class="row">
									<div class="col-md-6">
										<p><b>Bech32 Address</b>: <input type="text" class="form-control addressBech32" readonly></p>
									</div>

									<div class="col-md-6">
										<p><b>Bech32 Redeem Script</b>: <input type="text" class="form-control addressBech32RedeemScript" readonly></p>
									</div>
								</div>

								<br>
							</div>
						</div>

						<div class="hidden verifyData" id="verifyHDaddress">
							<h4>HD Address</h4>
							<p><span style="float:right"><a href="" target="_blank" class="verifyLink" title="Link to this page"><span class="glyphicon glyphicon-link"></span></a></span>The key <small><span class="hdKey hidden"></span></small> has been decoded</p>
							<div class="row">
								<div class="col-md-2">
									<b>Type</b><br>
									<span class="key_type"></span>
								</div>

								<div class="col-md-5">
									<b>Chain Code</b><br>
									<input type="text" class="form-control chain_code" value="" readonly>
								</div>


								<div class="col-md-5">
									<b>Key</b><br>
									<input type="text" class="form-control hdwifkey" value="" readonly>
								</div>
							</div>

							<div class="row">
								<div class="col-md-3">
									<b>Version</b><br>
									<input type="text" class="form-control version" value="" readonly>
								</div>

								<div class="col-md-3">
									<b>Parent FingerPrint</b><br>
									<input type="text" class="form-control parent_fingerprint" value="" readonly>
								</div>

								<div class="col-md-3">
									<b>Depth</b><br>
									<input type="text" class="form-control depth" value="" readonly>
								</div>

								<div class="col-md-3">
									<b>Index</b><br>
									<input type="text" class="form-control child_index" value="" readonly>
								</div>
							</div>

							<div class="row">
							</div>

							<hr>

							<h4>Key Derivation</h4>
							<p>The path of key derivation</p>

							<div class="row">
								<div class="col-md-8">
									<b>Path</b><br>
									<select class="form-control">
										<option>Simple: m/i</option>
									</select>
								</div>

								<div class="col-md-2">
									<b>Index (Start)</b><br>
									<input type="text" class="form-control derivation_index_start" value="0">
								</div>

								<div class="col-md-2">
									<b>Index (End)</b><br>
									<input type="text" class="form-control derivation_index_end" value="1">
								</div>

							</div>

							<hr>
							<h4>Keys</h4>

							<p>Keys derived from the hd address provided</p>

							<div class="derived_data">
								<table class="table table-striped table-hover">
									<thead>
										<tr><td><b>Index</b></td><td><b>Address</b><td><b>Private Key (WIF)</b></td></td><td><b>Extended xPub</b></td><td><b>Extended xPrv</b></td></tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>

							<br>
						</div>

						<div id="verifyStatus" class="alert alert-danger hidden"><span class="glyphicon glyphicon-exclamation-sign"></span> Unable to decode</div>

						<input type="button" value="Submit" class="btn btn-primary" id="verifyBtn">
						<br>

					</div>

	<div class="hidden" id="entropybucket"></div>
	</body>
</html>
