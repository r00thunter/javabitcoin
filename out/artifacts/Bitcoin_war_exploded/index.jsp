<!DOCTYPE html> 
<html lang="en">
	<head>

		<title>Unicrypto : Bitcoin Wallet</title>
		<link rel="icon" href="images/favicon.png" type="images/png" sizes="16x16">

		<link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
		<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
		<link rel="stylesheet" href="css/style.css" media="screen">
		<link rel="stylesheet" href="css/bitcoinstyle.css">

		
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
		<script src="https://ds.fusioncharts.com/2.0.8/js/ds.js"></script>
		<script type="text/javascript" src="http://cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>
		<script type="text/javascript" src="https://cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>
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
						<a href="index.jsp" class="navbar-brand" id="homeBtn"><img src="images/navlogo.png" style="height:25px;margin-top:-5px"></a>
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

			<div id="content" class="container">

				<noscript class="alert alert-danger center-block"><span class="glyphicon glyphicon-exclamation-sign"></span> This page uses javascript, please enable it to continue!</noscript>
					
					<div class="tab-content">
					<div class="tab-pane tab-content active" id="home">
						<div class="row">
							<div class="col-md-12">
								<h2>Unicrypto <small>Welcome to the Blockchain</small></h2>
							</div>
						</div>

						<div class="jumbotron">
							<h1>Bitcoin. It's your money!</h1>
							<p>Be your own bank, take control of your own money and start using Bitcoin today!</p>
							<p><a class="btn btn-primary btn-lg" href="/Bitcoin_war_exploded/signup.jsp" role="button">SignUp &raquo;</a></p>
						</div>

						<hr>

						<div class="row">
							<div class="col-md-4">
								<h3><span class="glyphicon glyphicon-ok"></span> Decentralized</h3>
								<p>Unicrypto is a Decentralized web based wallet written in javascript.</p>
							</div>

							<div class="col-md-4">
								<h3><span class="glyphicon glyphicon-fullscreen"></span> MultiSig</h3>
								<p>We offer a fully transparent <a href="#newMultiSig">multisig</a> solution which works seamlessly offline and with other bitcoin clients.</p>
							</div>

							<div class="col-md-4">
								<h3><span class="glyphicon glyphicon-bitcoin"></span> Raw Transactions</h3>
								<p><a href="#newTransaction">Create</a>, <a href="#verify">verify</a>, <a href="#sign">sign</a> and <a href="#broadcast">broadcast</a> custom raw transactions online with advanced features and minimal effort!</p>
							</div>
						</div>

						<div class="row">
							<div class="col-md-4">
								<h3><span class="glyphicon glyphicon-piggy-bank"></span> Wallet</h3>
								<p>Quick access to an <a href="#wallet">online wallet</a> where only you have access to your own private keys &amp; can <a href="#fees">calculate your own fee</a>!</p>
							</div>

							<div class="col-md-4">
								<h3><span class="glyphicon glyphicon-globe"></span> Addresses</h3>
								<p>We support <a href="#newAddress">regular addresses</a>, <a href="#newMultiSig">multisig</a>, <a href="#newSegWit">segwit / bech32</a> and stealth all with access to your own private keys!</p>
							</div>

					</div>
						<div class="container-fluid">
							<div class="row text-center mt-4 pl-3 pr-3">
								<div class="col-sm">
									<div class="card">
										<div class="card-body">
											<div class="h3">Bitcoin(BTC)</div>
											<div class="h5">(Price in USD)</div>
											<div id="btc_val" class="h4 kpi-value"></div>
										</div>
									</div>
								</div>
								<div class="col-sm">
									<div class="card">
										<div class="card-body">
											<div class="h3">Litecoin(LTC)</div>
											<div class="h5">(Price in USD)</div>
											<div id="ltc_val" class="h4 kpi-value"></div>
										</div>
									</div>
								</div>
								<div class="col-sm">
									<div class="card">
										<div class="card-body">
											<div class="h3">Ethereum</div>
											<div class="h5">(Price in USD)</div>
											<div id="eth_val" class="h4 kpi-value"></div>
										</div>
									</div>
								</div>
							</div>

							<div class="row mt-4 pr-3 pl-3">
								<div class="col">
									<div class="card">
										<div class="card-body">
											<div id="chart-container"></div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<script>
							//Fetch the price of Ethereum
							const eth_api_url = 'https://api.cryptonator.com/api/ticker/eth-usd';
							function ethereumHttpObject() {
								try { return new XMLHttpRequest(); }
								catch (error) { }
							}
							function ethereumGetData() {
								var request = ethereumHttpObject();
								request.open("GET", eth_api_url, false);
								request.send(null);
								console.log(request.responseText);
								return request.responseText;
							}
							function ethereumDataHandler() {
								var raw_data_string = ethereumGetData();

								var data = JSON.parse(raw_data_string);

								var base = data.ticker.base;
								var target = data.ticker.target;
								var price = data.ticker.price;
								var volume = data.ticker.volume;
								var change = data.ticker.change;
								var api_server_epoch_timestamp = data.timestamp;
								var api_success = data.success;
								var api_error = data.error;
								return price;
							}

							document.getElementById("eth_val").innerHTML = "$" + Math.round(ethereumDataHandler());


							//Fetch the price of Litecoin
							const ltc_api_url = 'https://api.cryptonator.com/api/ticker/ltc-usd';
							function litecoinHttpObject() {
								try { return new XMLHttpRequest(); }
								catch (error) { }
							}
							function litecoinGetData() {
								var request = litecoinHttpObject();
								request.open("GET", ltc_api_url, false);
								request.send(null);
								//console.log(request.responseText);
								return request.responseText;
							}
							function litecoinDataHandler() {
								var raw_data_string = litecoinGetData();
								var data = JSON.parse(raw_data_string);
								var base = data.ticker.base;
								var target = data.ticker.target;
								var price = data.ticker.price;
								var volume = data.ticker.volume;
								var change = data.ticker.change;
								var api_server_epoch_timestamp = data.timestamp;
								var api_success = data.success;
								var api_error = data.error;
								return price;
							}
							document.getElementById("ltc_val").innerHTML = "$" + Math.round(litecoinDataHandler());

							//Fetch the value of Bitcoin
							const api_url = 'https://api.cryptonator.com/api/ticker/btc-usd';

							const time_interval = 2;
							function addLeadingZero(num) {
								return (num <= 9) ? ("0" + num) : num;
							}
							function clientDateTime() {
								var date_time = new Date();
								// var weekday = date_time.getDay();
								// var today_date = date_time.getDate();
								// var month = date_time.getMonth();
								// var full_year = date_time.getFullYear();
								var curr_hour = date_time.getHours();
								var zero_added_curr_hour = addLeadingZero(curr_hour);
								var curr_min = date_time.getMinutes();
								var curr_sec = date_time.getSeconds();
								var curr_time = zero_added_curr_hour + ':' + curr_min + ':' + curr_sec;
								return curr_time
							}
							function makeHttpObject() {
								try { return new XMLHttpRequest(); }
								catch (error) { }
							}
							function bitcoinGetData() {
								var request = makeHttpObject();
								request.open("GET", api_url, false);
								request.send(null);
								return request.responseText;
							}
							function bitcoinDataHandler() {
								var raw_data_string = bitcoinGetData();
								var data = JSON.parse(raw_data_string);
								var base = data.ticker.base;
								var target = data.ticker.target;
								var price = data.ticker.price;
								var volume = data.ticker.volume;
								var change = data.ticker.change;
								var api_server_epoch_timestamp = data.timestamp;
								var api_success = data.success;
								var api_error = data.error;
								return price;
							}

							document.getElementById("btc_val").innerHTML = "$" + Math.round(bitcoinDataHandler());

							FusionCharts.ready(function () {
								var fusioncharts = new FusionCharts({
											id: "stockRealTimeChart",
											type: 'realtimeline',
											renderAt: 'chart-container',
											width: '100%',
											height: '350',
											dataFormat: 'json',
											dataSource: {
												"chart": {
													"caption": "Bitcoin Ticker",
													"subCaption": "",
													"xAxisName": "Local Time",
													"yAxisName": "USD",
													"numberPrefix": "$",
													"refreshinterval": "2",
													"slantLabels": "1",
													"numdisplaysets": "10",
													"labeldisplay": "rotate",
													"showValues": "0",
													"showRealTimeValue": "0",
													"theme": "fusion",
													"yAxisMaxValue": (bitcoinDataHandler().toString() + 20),
													"yAxisMinValue": (bitcoinDataHandler().toString() - 20),
												},
												"categories": [{
													"category": [{
														"label": clientDateTime().toString()
													}]
												}],
												"dataset": [{
													"data": [{
														"value": bitcoinDataHandler().toString()
													}]
												}]
											},
											"events": {
												"initialized": function (e) {
													function updateData() {
														// Get reference to the chart using its ID
														var chartRef = FusionCharts("stockRealTimeChart"),
																x_axis = clientDateTime(),
																y_axis = bitcoinDataHandler(),
																strData = "&label=" + x_axis + "&value=" + y_axis;
														// Feed it to chart.
														chartRef.feedData(strData);
													}
													e.sender.chartInterval = setInterval(function () {
														updateData();
													}, time_interval * 1000);
												},
												"disposed": function (evt, arg) {
													clearInterval(evt.sender.chartInterval);
												}
											}
										}
								);
								fusioncharts.render();
							});
						</script>
					</div>

	<div class="hidden" id="entropybucket"></div>
	</body>
</html>
