<!DOCTYPE html>
<html lang="en">
<head>

    <title>Unicrypto : Bitcoin Wallet</title>
    <link rel="icon" href="images/favicon.png" type="images/png" sizes="16x16">

    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="css/style.css" media="screen">
    <link rel="stylesheet" href="css/bitcoinstyle.css">

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
    <script type="text/javascript"></script>

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
    <div class="tab-pane tab-content" id="newTransaction">
        <h2>Transaction <small>Create a new transaction</small></h2>
        <p>Use this page to create a raw transaction</p>

        <b>Address, WIF key or Redeem Script</b>:
        <div class="input-group">
							<span class="input-group-btn">
								<button class="btn btn-info qrcodeScanner" type="button" data-toggle="modal" data-target="#modalQrcodeScanner" forward-result="#redeemFrom"><span class="glyphicon glyphicon-camera"></span></button>
							</span>
            <input type="text" id="redeemFrom" class="form-control" value="">
            <span class="input-group-btn">
								<button id="redeemFromBtn" class="btn btn-info" type="button">Load</button>
							</span>
        </div>

        <br>

        <div class="hidden alert alert-danger" id="redeemFromStatus"></div>

        <div class="hidden alert alert-info" id="redeemFromAddress"></div>

        <div>
            <a href="javascript:;" class="optionsCollapse"><div class="well well-sm"><span class="glyphicon glyphicon-collapse-down" id="glyphcollapse"></span> Advanced Options</div></a>

            <div class="hidden optionsAdvanced">

                <label>Clear Inputs</label>
                <p class="checkbox">
                    <label><input type="checkbox" id="clearInputsOnLoad" class="checkbox-inline" checked> Clear existing inputs when new inputs are loaded.</label>
                </p>

                <hr>

                <label>Null Data</label> <span class="text-muted text-normal">(80 byte limit, <i>40 bytes recommended</i>)</span>
                <p class="checkbox">
                    <label><input type="checkbox" id="opReturn" class="checkbox-inline"> Allow data to be sent within the transaction and stored in the blockchain by using <a href="https://bitcoin.org/en/developer-guide#null-data" target="_"blank">OP_RETURN</a>.</label>
                <div class="text-muted">When using this option you may enter a hex string or address into the address field on the output tab.</div>
                </p>

                <hr>

                <label>Lock Time</label>
                <p>The <a href="https://bitcoin.org/en/developer-guide#locktime-and-sequence-number">locktime</a> indicates the earliest time a transaction can be added to the block chain.</p>
                <input type="text" class="form-control" value="0" id="nLockTime">

                <hr>


                <label>Replace By Fee (RBF)</label>
                <p class="checkbox">
                    <label><input type="checkbox" id="txRBF" class="checkbox-inline"> Make this a <a href="https://en.bitcoin.it/wiki/Transaction_replacement" target="_blank">RBF transaction</a>.</label>
                </p>

                <hr>

                <label>Network</label>
                <p>The <a href="#settings">settings</a> page can be used to select alternative networks of which you can retrieve your unspent outputs and broadcast a signed transaction into.</p>

                <hr>
            </div>
        </div>

        <ul class="nav nav-tabs" id="putTabs">
            <li class="active"><a href="#txoutputs" data-toggle="tab">Outputs <small>(<span id="totalOutput">0.00000000</span>)</small></a></li>
            <li><a href="#txinputs" data-toggle="tab">Inputs <small>(<span id="totalInput">0.00000000</span>)</small></a></li>
        </ul>

        <br>

        <div class="tab-content">

            <div class="tab-pane fade in active" id="txoutputs">

                <span class="pull-right"><a href="javascript:;" id="donateTxBtn" class="btn btn-link"><span class="glyphicon glyphicon-heart"></span> Donate!</a></span>

                <p>Enter the address and amount you wish to make a payment to.</p>
                <div class="row">
                    <div class="col-xs-8">
                        <label><abbr title="Address to send to">Address</abbr></label>
                    </div>
                    <div class="col-xs-3">
                        <label><abbr title="Amount to send">Amount</abbr></label>
                    </div>
                    <div class="col-xs-1">
                    </div>
                </div>

                <div id="recipients">
                    <div class="row recipient">
                        <div class="col-xs-8">
                            <input type="text" class="form-control address" placeholder="1">
                        </div>
                        <div class="col-xs-3">
                            <input type="text" class="form-control amount" placeholder="0.00">
                        </div>
                        <div class="col-xs-1">
                            <a href="javascript:;" class="addressAddTo"><span class="glyphicon glyphicon-plus"></span></a>
                        </div>
                    </div>
                </div>
            </div>


            <div class="tab-pane fade" id="txinputs">
                <p>Enter the details of inputs you wish to spend.</p>
                <div class="row">
                    <div class="col-xs-5">
                        <label><abbr title="Transaction ID">Transaction ID:</abbr></label>
                    </div>
                    <div class="col-xs-1">
                        <label><abbr title="Transaction Input Number">N</abbr></label>
                    </div>
                    <div class="col-xs-3">
                        <label>Script</label>
                    </div>
                    <div class="col-xs-2">
                        <label><abbr title="This field is for accounting purposes only - the entire input will be spent!">Amount</abbr></label>
                    </div>
                    <div class="col-xs-1">
                    </div>
                </div>

                <div id="inputs">
                    <div class="row inputs">
                        <div class="col-xs-5">
                            <input type="text" class="form-control txId" placeholder="">
                        </div>
                        <div class="col-xs-1">
                            <input type="text" class="form-control txIdN" placeholder="0">
                        </div>
                        <div class="col-xs-3">
                            <input type="text" class="form-control txIdScript">
                        </div>
                        <div class="col-xs-2">
                            <input type="text" class="form-control txIdAmount" placeholder="0.00">
                        </div>
                        <div class="col-xs-1">
                            <a href="javascript:;" class="txidAdd"><span class="glyphicon glyphicon-plus"></span></a>
                            <a href="javascript:;" class="txidClear"><span class="glyphicon glyphicon-minus"></span></a>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <br>

        <div class="row">
            <div class="col-xs-3">
                <label><abbr title="What is not spent will be used as a transaction fee, so remember to add a &quot;change address&quot;">Transaction Fee</abbr>&nbsp;&nbsp;<a href="javascript:;" id="feesestnewtx"><span class="glyphicon glyphicon-question-sign"></span></a></label>
                <input type="text" id="transactionFee" class="form-control" value="0.0000" readonly>
            </div>
        </div>

        <br>

        <div id="transactionCreateStatus" class="alert alert-danger hidden"></div>

        <div id="transactionCreate" class="alert alert-success hidden">
            <label>Transaction</label>
            <button class="qrcodeBtn btn btn-default" type="button" data-toggle="modal" data-target="#modalQrcode" style="float:right;"><span class="glyphicon glyphicon-qrcode"></span></button>

            <p>The transaction below has been generated and encoded. It can be broadcasted once it has been signed.</p>
            <br>
            <textarea class="form-control" style="height:150px" readonly></textarea>

            <p class="text-muted">Size: <span class="txSize">0</span> <i>bytes</i></p>
        </div>

        <input type="button" value="Submit" class="btn btn-primary" id="transactionBtn">

        <br>
    </div>
</body>
</html>