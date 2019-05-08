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
                            <li><a href="/Bitcoin_war_exploded/transaction.jsp">Transaction</a></li>
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

<div class="tab-pane tab-content" id="fees">
    <h2>Bitcoin Fee Calculator</h2>
    <p>This page will give you a guide on the lowest fee to use to get your transaction included within the next few blocks. It works by predicting the size of a transaction and comparing it to another transaction in a recent block to determine an appropriate fee.</p>

    <div align="center" class="alert alert-info">
        <h2><span class="glyphicon glyphicon-question-sign"></span> Recommended Fee: <span class="recommendedFee">0.00000000</span> BTC <small> <br> for a transaction of <span class="feeTxSize">0</span> bytes</small></h2>
        <span class="text-muted"><i><span class="feeSatByte">?</span> Sat/Byte</i></span>
    </div>

    <div id="txsliders" class="row">
        <div class="col-md-6 txinputs">

            <div align="center"><b><span class="txtotal total">0</span><br>Inputs</b></div>
            <div id="txinputstype" align="center" class="small text-muted">
                <br>
                <span><span class="txsize">0</span> Bytes</span>
            </div>

            <h4 class="regular"><abbr title="Spending from a compressed legacy address. p2pkh">Regular</abbr> <small>Compressed</small>
                <span class="badge inputno" title="Number of Regular Inputs">1</span>
                <small><span class="bytes">148</span> bytes</small>
                <small class="estimate hidden"><em> *estimate</em></small>
            </h4>

            <div class="input-group">
                <span class="input-group-btn"><button class="btn sliderbtn down" type="button"><span class="glyphicon glyphicon-chevron-left"></span></button></span>
                <input type="range" min="0" max="100" value="1" class="slider txinput txi_regular" rel="regular">
                <span class="input-group-btn"><button class="btn sliderbtn up" type="button"><span class="glyphicon glyphicon-chevron-right"></span></button></span>
            </div>

            <h4 class="segwit"><abbr title="Spending from a segwit address. p2sh">SegWit</abbr>
                <span class="badge inputno" title="Number of SegWit Inputs">0</span>
                <small><span class="bytes">0</span> bytes</small>
                <small class="estimate hidden"><em> *estimate</em></small>
            </h4>

            <div class="input-group">
                <span class="input-group-btn"><button class="btn sliderbtn down" type="button"><span class="glyphicon glyphicon-chevron-left"></span></button></span>
                <input type="range" min="0" max="100" value="0" class="slider txinput txi_segwit" rel="segwit">
                <span class="input-group-btn"><button class="btn sliderbtn up" type="button"><span class="glyphicon glyphicon-chevron-right"></span></button></span>
            </div>

            <h4 class="multisig"><abbr title="Spending from a multisig address. p2sh">MultiSig</abbr>
                <span class="badge inputno" title="Number of MultiSig Inputs">0</span>
                <small><span class="bytes">0</span> bytes</small>
                <small class="estimate hidden"><em> *estimate</em></small>
            </h4>

            <div class="input-group">
                <span class="input-group-btn"><button class="btn sliderbtn down" type="button"><span class="glyphicon glyphicon-chevron-left"></span></button></span>
                <input type="range" min="0" max="100" value="0" class="slider txinput txi_multisig" rel="multisig">
                <span class="input-group-btn"><button class="btn sliderbtn up" type="button"><span class="glyphicon glyphicon-chevron-right"></span></button></span>
            </div>

            <h4 class="hodl"><abbr title="Spending from a time locked address. p2sh">Hodl</abbr> <small>Time Locked</small>
                <span class="badge inputno" title="Number of Hodl Inputs">0</span>
                <small><span class="bytes">0</span> bytes</small>
                <small class="estimate hidden"><em> *estimate</em></small>
            </h4>

            <div class="input-group">
                <span class="input-group-btn"><button class="btn sliderbtn down" type="button"><span class="glyphicon glyphicon-chevron-left"></span></button></span>
                <input type="range" min="0" max="100" value="0" class="slider txinput txi_hodl" rel="hodl">
                <span class="input-group-btn"><button class="btn sliderbtn up" type="button"><span class="glyphicon glyphicon-chevron-right"></span></button></span>
            </div>

            <h4 class="unknown"><abbr title="Spending from an unrecognized input. p2sh">Unknown</abbr>
                <span class="badge inputno" title="Number of Unknown Inputs">0</span>
                <small><span class="bytes">0</span> bytes</small>
                <small class="estimate hidden"><em> *estimate</em></small>
            </h4>

            <div class="input-group">
                <span class="input-group-btn"><button class="btn sliderbtn down" type="button"><span class="glyphicon glyphicon-chevron-left"></span></button></span>
                <input type="range" min="0" max="100" value="0" class="slider txinput txi_unknown" rel="unknown">
                <span class="input-group-btn"><button class="btn sliderbtn up" type="button"><span class="glyphicon glyphicon-chevron-right"></span></button></span>
            </div>

            <br>
        </div>

        <div class="col-md-6 txoutputs">

            <div align="center"><b><span class="txtotal total">0</span><br>Outputs</b></div>
            <div id="txoutputtype" align="center" class="small text-muted">
                <br>
                <span><span class="txsize">0</span> Bytes</span>
            </div>

            <h4 class="p2pkh"><abbr title="A pay 2 public key hash. Starts with 1. Used with legacy addresses">Regular</abbr> <small>p2pkh (1...)</small>
                <span class="badge outputno" title="Number of p2pkh Outputs">2</span>
                <small><span class="bytes">68</span> bytes</small>
                <small class="estimate hidden"><em> *estimate</em></small>
            </h4>

            <div class="input-group">
                <span class="input-group-btn"><button class="btn sliderbtn down" type="button"><span class="glyphicon glyphicon-chevron-left"></span></button></span>
                <input type="range" min="0" max="100" value="2" class="slider txoutput txo_p2pkh" rel="p2pkh">
                <span class="input-group-btn"><button class="btn sliderbtn up" type="button"><span class="glyphicon glyphicon-chevron-right"></span></button></span>
            </div>

            <h4 class="p2sh"><abbr title="A pay 2 script hash address. Starts with a 3. For example a segwit or multisig address">Regular</abbr> <small>p2sh (3...)</small>
                <span class="badge outputno" title="Number of p2sh Outputs">0</span>
                <small><span class="bytes">0</span> bytes</small>
                <small class="estimate hidden"><em> *estimate</em></small>
            </h4>

            <div class="input-group">
                <span class="input-group-btn"><button class="btn sliderbtn down" type="button"><span class="glyphicon glyphicon-chevron-left"></span></button></span>
                <input type="range" min="0" max="100" value="0" class="slider txoutput txo_p2sh" rel="p2sh">
                <span class="input-group-btn"><button class="btn sliderbtn up" type="button"><span class="glyphicon glyphicon-chevron-right"></span></button></span>
            </div>

            <br>
        </div>
    </div>

    <br>

    <div class="row">
        <div class="col-md-12">
            <div class="text-muted">Chargable Transaction Size: <span class="feeTxSize">0</span> bytes</div>
        </div>
    </div>

    <hr>

    <div class="row">
        <div class="col-md-12 recommended">

            <h3>Blockchain Data <span class="pull-right"><button type="button" id="feeStatsReload" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-refresh"></span></button></span></h3>

            <p>This is based on us comparing your transaction against a very recent transaction found in a very recent block</p>
            <p><b>Block Height</b>: <span class="blockHeight">?</span></p>
            <p class="hideOverflow"><b>Block #</b>: <span class="blockHash">?</span></p>
            <p><b>Block Time</b>: <span class="blockTime">?</span> <span class="blockDateTime text-muted"></span></p>
            <p class="hideOverflow"><b>Transaction ID</b>: <span class="txId">?</span></p>
            <p><b>Transaction Size</b>: <span class="txSize">0</span> bytes</p>
            <p><b>Transaction Fee</b>: <span class="txFee">0.00000000</span></p>
            <p><b>Satoshi per Byte</b>: <span class="feeSatByte">0</span></p>

            <p>Based on your data and this recently mined transaction we recommend a fee of <b><span class="recommendedFee">0.00000000</span> BTC</b> to get it into the next few blocks</p>
        </div>
    </div>

    <br>

    <div class="row">

        <div class="col-md-12">
            <a href="javascript:;" id="advancedFeesCollapse">
                <div class="well well-sm"><span class="glyphicon glyphicon-collapse-down"></span> Advanced Options &amp; Raw Transaction</div>
            </a>
        </div>
    </div>

    <div class="row hidden" id="advancedFees">
        <div class="col-md-12">
            <p>Enter your unsigned or signed hex encoded transaction below:</p>
            <textarea class="form-control txhex" style="height:160px"></textarea><br>
            <button type="button" class="btn btn-primary" id="feesAnalyseBtn">Analyse Transaction</button>

            <hr>

            <h4>Estimate Input Size <small>in bytes</small></h4>

            <div class="form-inline">
                <div class="form-group">
                    <label for="est_txi_regular">Regular</label>
                    <input type="number" class="form-control" id="est_txi_regular" value="107">
                </div>
                <div class="form-group">
                    <label for="est_txi_segwit">SegWit</label>
                    <input type="number" class="form-control" id="est_txi_segwit" value="27">
                </div>
                <div class="form-group">
                    <label for="est_txi_multisig">MultiSig</label>
                    <input type="number" class="form-control" id="est_txi_multisig" value="351">
                </div>
                <div class="form-group">
                    <label for="est_txi_hodl">Hodl</label>
                    <input type="number" class="form-control" id="est_txi_hodl" value="78">
                </div>
                <div class="form-group">
                    <label for="est_txi_unknown">Unknown</label>
                    <input type="number" class="form-control" id="est_txi_unknown" value="512">
                </div>
            </div>

            <h4>Estimate Output Size <small> in bytes</small></h4>
            <div class="form-inline">
                <div class="form-group">
                    <label for="est_txo_p2pkh">Regular P2PKH</label>
                    <input type="number" class="form-control" id="est_txo_p2pkh" value="25">
                </div>
                <div class="form-group">
                    <label for="est_txo_p2sh">Regular P2SH</label>
                    <input type="number" class="form-control" id="est_txo_p2sh" value="23">
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
