<!DOCTYPE html>
<html lang="en">
        <head>
        <link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Hierarchy</title>
        
        <!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
-->        <link href="<%=request.getContextPath()%>/css/Magento.css" rel="stylesheet">
        <!--<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>-->
        <!-- <script src="js/bootstrap-responsive.min.js"></script>-->

        <!-- Just for debugging purposes. Don't actually copy this line! -->
        <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
              <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
            <![endif]-->
        <!-- Bootstrap core JavaScript
            ================================================== -->

        <!--[if IE]>
            <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <!--[if lt IE 9]>
            <script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
        <![endif]-->

        <link rel="stylesheet" href="js/jstree/themes/default/style.min.css">
        <script src="js/jstree/jstree.min.js"></script>
        <!--<script type="text/javascript" src="js/pop.js"></script>-->
        <style>
.jstree .icn { width: 20px; height: 20px; display: inline-block; background: url(images/jstree.png) no-repeat 0 0 transparent }
.jstree .icn.plus { background-position: -15px -20px }
.jstree .icn.area { background-position: -2px -3px }
.jstree .icn.user { background-position: -25px -3px }
.jstree .icn.star { background-position: -50px -3px }
.jstree-default .jstree-open > .jstree-ocl { background: url(images/jstree.png) no-repeat -3px -25px transparent }
.jstree-default .jstree-closed > .jstree-ocl { background: url(images/jstree.png) no-repeat -28px -25px transparent }
/*.jstree-default .jstree-leaf > .jstree-ocl {background: none}
            
            .jstree-default .jstree-last {background: #8F8F8F;padding-left: 0 !important}
            .jstree-children {background: #DADADA}
            .jstree ul > li > ul > li > ul > li {background: #F2F2F2 !important}
            
            .jstree-children .jstree-node {border-bottom: solid 1px #fff;margin: 0;padding-left: 24px}*/

            .jstree-default .jstree-clicked { background: none; border-radius: 0; box-shadow: none; color: #AE2760 }
ul.jstree-container-ul { /* background: #8F8F8F;*/ overflow: hidden }
li.jstree-open > ul { /*  background: #DADADA;*/ display: block; }
li.jstree-open > ul li.jstree-open > ul { /*background: #F2F2F2;*/ position: relative; left: -24px; padding-left: 24px; width: 100%; }
.txt-bx { border: 1px solid rgb(204, 204, 204); box-shadow: rgba(0, 0, 0, 0.0745098) 0px 1px 1px inset; width: 100%; background: none rgb(255, 255, 255); }
</style>
        <script>
            function customMenu(node) {

                var tree = $("#jstree").jstree(true);

                if (node.type == 'root') {
                    var items = {
                        addLocationItem: {
                            label: "Add Location",
                            action: function(obj) {
                                //alert("Edit User");
                                //tree.delete_node(node);
								$('#pnl-mhaddedit .mh-action').hide(function() {
									$('#pnl-mhaddedit #mh-addlocation').show();
								});
								
                            },
                            icon: "fa fa-trash-o"

                        },
                        editItem: {
                            label: "Edit Location",
                            action: function(obj) {
                                //alert("Edit");
                                //tree.delete_node(node);
								$('#pnl-mhaddedit .mh-action').hide(function() {
									$('#pnl-mhaddedit #mh-editlocation').show();
								});
                            },
                            icon: "fa fa-trash-o"

                        },
						
                        addUserItem: {
                            label: "Add User",
                            action: function(obj) {
                                //alert("Edit User");
                                //tree.delete_node(node);
								$('#pnl-mhaddedit .mh-action').hide(function() {
									$('#pnl-mhaddedit #mh-adduser').show();
								});
                            },
                            icon: "fa fa-trash-o"

                        }
						
                    };
                } else if (node.type == 'area') {
                    var items = {
						addLocationItem: {
                            label: "Add Location",
                            action: function(obj) {
                             //  alert("Add Location");
                                //tree.delete_node(node);
								$('#pnl-mhaddedit .mh-action').hide(function() {
									$('#pnl-mhaddedit #mh-sec-addlocation').show();
								});
                            },
                            icon: "fa fa-trash-o"

                        },

                        editItem: {
                            label: "Edit Location",
                            action: function(obj) {
                              //  alert("Edit Location");
                                //tree.delete_node(node);
								$('#pnl-mhaddedit .mh-action').hide(function() {
									$('#pnl-mhaddedit #mh-sec-editlocation').show();
								});
                            },
                            icon: "fa fa-trash-o"

                        },
                          deleteItem: {
                            label: "Delete Location",
                            action: function(obj) {
                              //  alert("Add User");
                                //tree.delete_node(node);
								//$('#pnl-mhaddedit .mh-action').hide(function() {
								//	$('#pnl-mhaddedit #mh-sec-deletelocation').show();
							//	});
						    },
                            icon: "fa fa-trash-o"

                        },
                        addUserItem: {
                            label: "Add User",
                            action: function(obj) {
                              //  alert("Add User");
                                //tree.delete_node(node);
								$('#pnl-mhaddedit .mh-action').hide(function() {
									$('#pnl-mhaddedit #mh-sec-adduser').show();
								});
                            },
                            icon: "fa fa-trash-o"

                        }
                    };
                } else if (node.type == 'user') {
                    var items = {
                        editUserItem: {
                            label: "Edit User",
                            action: function(obj) {
                             //   alert("Edit User");
                                //tree.delete_node(node);
								$('#pnl-mhaddedit .mh-action').hide(function() {
									$('#pnl-mhaddedit #mh-advisor-edit-user').show();
								});
                            },
                            icon: "fa fa-trash-o"

                        },                        deleteItem: {
                            label: "Delete User",
                            action: function(obj) {
                               // alert("Add User");
                                //tree.delete_node(node);
							//	$('#pnl-mhaddedit .mh-action').hide(function() {
							//		$('#pnl-mhaddedit #mh-advisor-delete-user').show();
							//	});
                            },
                            icon: "fa fa-trash-o"

                        }

                    };
                }

                return items;
            }

            $(document).ready(function() {
				$('#pnl-mhaddedit .mh-action').hide();
				$('#pnl-mh-advisor-addedit .mh-action').hide();

				$('#pnl-mh-sec-addedit .mh-action').hide();

                $('#jstree').jstree({
                    "contextmenu": {
                        "select_node": true,
                        "show_at_node": false,
                        "items": customMenu
                    },
                    "types": {
                        "#": {"max_children": 1, "max_depth": 4, "valid_children": ["root"]},
                        "root": {"icon": "", "valid_children": ["area"]},
                        "default": {"valid_children": ["default", "file"]},
                        "user": {"icon": "icn user", "valid_children": []},
                        "area": {"icon": "icn area", "valid_children": []}
                    },
                    "plugins": ["contextmenu", "types"],
                    'core': {
                        'data': [
                            {
                                'text': 'AG-VISTA(ID)',
                                'state': {
                                    'opened': true,
                                    'selected': true
                                },
                                'type': 'root',
                                'children': [
                                    {
                                        'text': 'South Delhi',
                                        "type": "area",
                                        'children': [
                                            {
                                                'text': 'Advisor1',
                                                "type": "user"
                                            },
                                            {
                                                'text': '<span class="icn star"></span>Advisor2',
                                                "type": "user",
                                                'children': [
                                                ]
                                            },
                                            {
                                                'text': 'Advisor3',
                                                "type": "user",
                                                'children': [
                                                ]
                                            }

                                        ]
                                    },
                                    {
                                        'text': 'North Delhi',
                                        "type": "area",
                                        'children': [
                                            {
                                                'text': '<span class="icn star"></span>Advisor4',
                                                "type": "user"
                                            },
                                            {
                                                'text': 'Advisor5',
                                                "type": "user"
                                            }
                                        ]
                                    }
                                ]
                            }
                        ]
                    }

                });
                $("#jstree").on('open_node.jstree', function(e, data) {
                    $('li.jstree-open > ul li.jstree-open > ul').css({
                        'width': ($(this).width() + 0) + 'px'
                    });
                });

            });
        </script>
        </head>
        <body>
        <section>
          <div class="container">
            <div class="container-head">
              <div class="col-md-12 text-right"> <span class="pull-left">Manage Hierarchy</span> </div>
            </div>
            <div class="container-body">
              <div class=" col-md-3 sidebar-offcanvas" role="navigation" style="margin-top:10px; padding-left:10px;">
                <div class="list-group"> <a class="list-group-item active"  style="cursor: default;">Profile</a> <a class="list-group-item profiledivlink" id="personalInfoPPLink" name="personalInfoDiv" onclick="showDiv('personalInfoDiv')" style="cursor: pointer;" >Personal Info</a> <a class="list-group-item profiledivlink" id="mfFileUploadConfigPPLink" name="mfFileUploadConfigDiv" onclick="showPaymentDiv('mfFileUploadConfigDiv')" style="font-weight: bold; cursor: pointer;">Manage Hierarchy</a> </div>
              </div>
              <!-- center -->
              
              <div class="col-md-9" style="margin-top:10px; padding-left:10px;" id="pnl-bv"> <a class="list-group-item active" style="cursor: default;">Manage Hierarchy </a>
                <div class="list-group">
                  <div class="list-group-item" id="biz-panels">
                    <div class="row">
                      <div class="col-md-3">
                        <div id="jstree" class="thumbnail"> </div>
                      </div>
                      <div class="col-md-8" style="margin-left:10px; width: 73%;">
                        <div id="pnl-mhaddedit">
                          <div class="mh-action" id="mh-addlocation"> <strong>Add Location</strong>
                            <div class="table-responsive" id="display_table_lead" style="border:none;">
                              <div >
                                <form method="">
                                  <table class="table table-striped" cellpadding="5" cellspacing="5">
                                    <tr>
                                      <td width="25%">Location Name <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Description <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" id="" class="txt-bx"></td>
                                    </tr>
                                  </table>
                                </form>
                              </div>
                            </div>
                          </div>
                          <div class="mh-action" id="mh-editlocation"> <strong>Edit Location</strong>
                            <div class="table-responsive" id="display_table_lead" style="border:none;">
                              <div >
                                <form method="post"  >
                                  <table class="table table-striped" cellpadding="5" cellspacing="5">
                                    <tr>
                                      <td width="25%">Location Name <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Description <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" id="" class="txt-bx"></td>
                                    </tr>
                                  </table>
                                </form>
                              </div>
                            </div>
                          </div>
                          <div class="mh-action" id="mh-adduser"> <strong>Add User</strong>
                            <div class="table-responsive" id="display_table_lead" style="border:none;">
                              <form method="post" >
                                  <table class="table table-striped" cellpadding="5" cellspacing="5">
                                    <tr>
                                      <td width="25%">First Name <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Last Name <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">User Name <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Company Name</td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Email <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">ARN <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">EUIN <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Description <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                    <td width="25%">Is Head of Node</td>
                                    <td width="75%"><input name="one" type="radio" value=""> Yes  &nbsp;<input name="one" type="radio" value=""> No</td>
        					      </tr>
                                  </table>
                                </form>
                            </div>
                          </div>
                          
                          
                          <!--location Starts Here-->
                          
                          <div class="mh-action" id="mh-sec-addlocation"> <strong>Add Location Under</strong>
                            <div class="table-responsive" id="display_table_lead" style="border:none;">
                              <div >
                                <form method="post"  >
                                  <table class="table table-striped" cellpadding="5" cellspacing="5">
                                    <tr>
                                      <td width="25%">Location Name <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Description <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                  </table>
                                </form>
                              </div>
                            </div>
                          </div>
                          <div class="mh-action" id="mh-sec-editlocation"> <strong>Edit Location of</strong>
                            <div class="table-responsive" id="display_table_lead" style="border:none;">
                              <div >
                                <form method="post"  >
                                  <table class="table table-striped" cellpadding="5" cellspacing="5">
                                    <tr>
                                      <td width="25%">Location Name <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Description <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                  </table>
                                </form>
                              </div>
                            </div>
                          </div>
                          <div class="mh-action" id="mh-sec-adduser"> <strong>Add User Under Location</strong>
                            <div class="table-responsive" id="display_table_lead" style="border:none;">
                              <div >
                                <form method="post"  >
                                  <table class="table table-striped" cellpadding="5" cellspacing="5">
                                    <tr>
                                      <td width="25%">First Name <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Last Name <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">User Name <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Company Name</td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Email <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">ARN <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">EUIN <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Description <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                    <td width="25%">Is Head of Node</td>
                                    <td width="75%"><input name="one" type="radio" value=""> Yes  &nbsp;<input name="one" type="radio" value=""> No</td>
        					      </tr>
                                  </table>
                                </form>
                              </div>
                            </div>
                          </div>
                          
                          <!--location Ends Here--> 
                          
                          <!--Advisor Starts Here-->
                          <div class="mh-action" id="mh-advisor-edit-user"> <strong>Edit User</strong>
                            <div class="table-responsive" id="display_table_lead" style="border:none;">
                              <form method="post" >
                                  <table class="table table-striped" cellpadding="5" cellspacing="5">
                                    <tr>
                                      <td width="25%">First Name <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Last Name <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">User Name <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Company Name</td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Email <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">ARN <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">EUIN <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Description <span class="red">*</span></td>
                                      <td width="75%"><input name="" type="text" class="txt-bx"></td>
                                    </tr>
                                      <tr>
                                    <td width="25%">Is Head of Node</td>
                                    <td width="75%"><input name="one" type="radio" value=""> Yes  &nbsp;<input name="one" type="radio" value=""> No</td>
        					      </tr>
                                  </table>
                                </form>
                            </div>
                          </div>
                          
                          <!--Advisor Ends Here--> 
                          
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-3 pull-right text-right">
                        <input type="button" class="btn" value="Save" />
                        <input type="button" class="btn" value="Cancel" />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
</body>
</html>