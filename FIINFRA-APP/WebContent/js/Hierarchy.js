/**
 * 
 */

var option="";
var childrenArray = new Array();
var treeArray = new Array();
var myObj = new Object();
var currentArryToIterate = new Array();
var currentObj=new Object();
var locationId=0;
var locationDesToSet='';
var locationNameToSet='';
function customMenu(node) {

    var tree = $jq_1_9_3("#jstree1").jstree(true);

    if (node.type == 'root') {
        var items = {
            addLocationItem: {
                label: "Add Location",
                action: function(obj) {
                    //alert("Edit User");
                    //tree.delete_node(node);
					$('#pnl-mhaddedit .mh-action').hide(function() {
						$('#pnl-mhaddedit #mh-addlocation').show();
						$('#nodeLabel').html('Add Location');
						$('#manageHeirarchyLocationForm #locationId').val(0);
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
						$('#pnl-mhaddedit #mh-addlocation').show();
						$('#nodeLabel').html('Edit Location');
					 	$('#manageHeirarchyLocationForm #nodeDescription').val(locationDesToSet);
					 	$('#manageHeirarchyLocationForm #nodeLocation').val(locationNameToSet);
						//$('#locationId').val(locationId);
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
						$('#pnl-mhaddedit #mh-sec-adduser').show();
						$('#userLabel').html('Add User');
						$('#manageHeirarchySavePartnerForm #partyId').val(0);
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
						$('#pnl-mhaddedit #mh-addlocation').show();
						$('#nodeLabel').html('Add Location');
						$('#manageHeirarchyLocationForm #locationId').val(0);
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
						$('#pnl-mhaddedit #mh-addlocation').show();
						$('#nodeLabel').html('Edit Location');
						$('#manageHeirarchyLocationForm #nodeDescription').val(locationDesToSet);
					 	$('#manageHeirarchyLocationForm #nodeLocation').val(locationNameToSet);
						//$('#locationId').val(locationId);
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
						$('#userLabel').html('Add User');
						$('#manageHeirarchySavePartnerForm #partyId').val(0);
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
						$('#pnl-mhaddedit #mh-sec-adduser').show();
						$('#userLabel').html('Edit User');
						getEditPartner($('#manageHeirarchySavePartnerForm #partyId').val());
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



function locationClick(nodeId,level,locationName,locDescription){
	$('#manageHeirarchySavePartnerForm #currentNode').val(nodeId);
	$('#manageHeirarchyLocationForm #parentNodeId').val(nodeId);
	$('#manageHeirarchyLocationForm #level').val(level);
	$('#manageHeirarchyLocationForm #locationId').val(nodeId);
	locationNameToSet=locationName;
	locationDesToSet=locDescription;
}
function userClick(nodeId,partyId){
	$('#manageHeirarchySavePartnerForm #partyId').val(partyId);
	$('#manageHeirarchySavePartnerForm #currentNode').val(nodeId);
}
function createTree(){
// 	alert(result)
// 	result = JSON.parse(result);

	//return;
	var nodeList='${sessionScope.lstLocationData}';
	var userList='${sessionScope.lstPartnerHeirarchyData}';
	
	nodeList=JSON.parse(nodeList);
	userList=JSON.parse(userList);
	childrenArray= new Array();
	myObj = new Object();
	var cntr=0;
	$(nodeList).each(function(i,obj) {
		//alert(obj.locationId);
		var locationId=obj.locationId;
		var locationName=obj.locationName;
		var locationDescription=obj.locationDescription;
		var parentNodeId=obj.parentNodeId;
		var level=obj.level;
		var displaySeqNo=obj.displaySeqNo;
		var typeName='area';
		if(cntr==0){
			typeName='root';
			myObj.text='<b class="normal-fonts-location" onmousedown="locationClick(\''+locationId+'\',\''+(level+1)+'\',\''+locationName+'\',\''+locationDescription+'\')">'+locationName+'</b>';
			myObj.state='{opened": "true","selected":"true"}';
			myObj.type=typeName;
			myObj.nodeId=locationId;
			myObj.level=level;
			myObj.children=childrenArray;
			currentArryToIterate=childrenArray;
			createChildNodes(locationId,level,nodeList);
			createChildUsers(locationId,level,userList);
			cntr+=1;
		}else{
			createChildNodes(locationId,level,nodeList);
			createChildUsers(locationId,level,userList);
		}
	});
	
	$jq_1_9_3('#jstree1').jstree({
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
				myObj
            ]
        }

    });
    $("#jstree1").on('open_node.jstree', function(e, data) {
        $('li.jstree-open > ul li.jstree-open > ul').css({
            'width': ($(this).width() + 0) + 'px'
        });
    });
}
function createChildNodes(nodeId,nodeLevel,nodeList){
	$(nodeList).each(function(i,obj) {
		var locationId=obj.locationId;
		var locationName=obj.locationName;
		var locationDescription=obj.locationDescription;
		var parentNodeId=obj.parentNodeId;
		var level=obj.level;
		var displaySeqNo=obj.displaySeqNo;
		var typeName='area';
		var childArray=new Array();
		getChildArray(nodeId,nodeLevel);
		childArray=currentArryToIterate;
		currentArryToIterate==new Array();
		if(childArray==undefined)
			childArray=myObj['children'];
		if(parentNodeId==nodeId){
			var obj=new Object();
			obj.text='<b class="normal-fonts-location" onmousedown="locationClick(\''+locationId+'\',\''+(level+1)+'\',\''+locationName+'\',\''+locationDescription+'\')">'+locationName+'</b>';
			obj.state='{opened": "true","selected":"true"}';
			obj.type=typeName;
			obj.nodeId=locationId;
			obj.level=level;
			obj.children=new Array();
			childArray.push(obj);
		}
		//myObj.children=childArray;
// 		setChildArray(nodeId,nodeLevel,childArray);
		setTimeout(function() {
			setChildArray(nodeId,nodeLevel,childArray)
		}, 10000);
	});
}
function createChildUsers(nodeId,nodeLevel,userList){
	$(userList).each(function(i,obj) {
		var locationId=obj.locationId;
		var locationName=obj.locationName;
		var locationDescription=obj.locationDescription;
// 		var parentNodeId=obj.parentNodeId;
		var parentNodeId=locationId;
		var level=obj.level;
		var displaySeqNo=obj.displaySeqNo;
		var name=obj.userName;
		var partyId=obj.partyId;
		var typeName='user';
		var childArray=new Array();
		getChildArray(nodeId,nodeLevel);
		childArray=currentArryToIterate;
		currentArryToIterate==new Array();
		if(childArray==undefined)
			childArray=myObj['children'];
		if(parentNodeId==nodeId){
			var obj=new Object();
			obj.text='<b class="normal-fonts-location" onmousedown="userClick(\''+locationId+'\',\''+partyId+'\')">'+name+'</b>';
// 			obj.state='{opened": "true","selected":"true"}';
			obj.type=typeName;
			obj.nodeId=locationId;
			obj.level=level;
			obj.children=new Array();
			childArray.push(obj);
		}
		//myObj.children=childArray;
// 		setChildArray(nodeId,nodeLevel,childArray);
		setTimeout(function() {
			setChildArray(nodeId,nodeLevel,childArray)
		}, 10000);
	});
}

function getChildArray(nodeId,nodeLevel){
// 	if(currentArryToIterate=='' || currentArryToIterate==undefined){
// 		//alert('in if')
// 		currentArryToIterate=myObj['children'];
// 	}
// 		var obj=currentArryToIterate[0];
// 		if(obj==undefined || (myObj['level']==nodeLevel && myObj['nodeId']==nodeId)){
// 			currentObj=myObj;
// 			return;
// 			}
// 		var level=obj['level'];
// 		var nodeId1=obj['nodeId'];
// 		if(level==nodeLevel && nodeId1==nodeId){
// 			currentArryToIterate=obj['children'];
// 			currentObj=obj;
// 		}else{
// 			currentArryToIterate = jQuery.grep(currentArryToIterate, function( a ) {
// 	 			  return a !== obj;
// 	 			});
			
// 			setTimeout(function() {
// 				getChildArray(nodeId,nodeLevel);
// 			}, 3000);
// 		}
	//alert(myObj['level']);
	currentArryToIterate=myObj['children'];
	if(currentArryToIterate.length==0 || (myObj['level']==nodeLevel && myObj['nodeId']==nodeId)){
		currentObj=myObj;
			return;
		}
		var i=0;
		while(i<currentArryToIterate.length){
			var obj=currentArryToIterate[i];
			var level=obj['level'];
			var nodeId1=obj['nodeId'];
			if(level==nodeLevel && nodeId1==nodeId){
				currentArryToIterate=obj['children'];
	 			currentObj=obj;
				return;
			}else{
				var isToReturn=getChildArray1(nodeId,nodeLevel,obj);
				if(isToReturn==true){
					return;
				}
			}
			i+=1;
		}
}

function getChildArray1(nodeId,nodeLevel,newObj){
	var currentArryToIterate1=new Array();
	currentArryToIterate1=newObj['children'];
	if(currentArryToIterate1.length==0 || (newObj['level']==nodeLevel && newObj['nodeId']==nodeId)){
		//currentObj=newObj;
			return false;
		}
		var i=0;
		while(i<currentArryToIterate1.length){
			var obj=currentArryToIterate1[i];
			var level=obj['level'];
			var nodeId1=obj['nodeId'];
			if(level==nodeLevel && nodeId1==nodeId){
				currentArryToIterate=obj['children'];
	 			currentObj=obj;
				return true;
			}else{
				var isToReturn=getChildArray1(nodeId,nodeLevel,obj);
				if(isToReturn==true){
					return;
				}
			}
			i+=1;
		}
}
function setChildArray(nodeId,nodeLevel,childArray){
	currentArryToIterate=myObj['children'];
	if(currentArryToIterate.length==0 || (myObj['level']==nodeLevel && myObj['nodeId']==nodeId)){
		myObj.children=childArray;
		return;
		}
	
// 	alert(myObj.level==nodeLevel && myObj.nodeId==nodeId)
	var i=0;
	while(i<currentArryToIterate.length){
	var obj=currentArryToIterate[i];
	//alert(obj.nodeId)
	var level=obj['level'];
	var nodeId1=obj['nodeId'];
	var level2=currentObj['level'];
	var nodeId2=currentObj['nodeId'];
	//alert(level+"-----------"+nodeId1+"--------"+level2+"-----------"+nodeId2)
	if(level==level2 && nodeId1==nodeId2){
		obj.children=childArray;
		currentArryToIterate[i]=obj;
		//alert(obj.locationName)
// 		currentArryToIterate = $.map(currentArryToIterate, function (obj, i) {
// 		    return {
// 		        regex: new RegExp('\\b' + i + '\\b', 'g'),
// 		        value: obj
// 		    };
// 		});
		myObj.children=currentArryToIterate;
		return;
	}else{
// 		currentArryToIterate = jQuery.grep(currentArryToIterate, function( a ) {
//  			  return a !== obj;
//  			});
		
// 		setTimeout(function() {
// 			setChildArray(nodeId,nodeLevel,childArray)
// 		}, 3000);
	}
	i+=1;
	}
	}