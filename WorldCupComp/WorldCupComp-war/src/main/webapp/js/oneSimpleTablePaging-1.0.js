/**
 * OneSimpleTablePaging
 * - A small piece of JS code which does simple table pagination.
 *	 It is based on Ryan Zielke's tablePagination (http://neoalchemy.org/tablePagination.html)
 *   which is licensed under the MIT licenses: http://www.opensource.org/licenses/mit-license.php
 *   Button designs are based on Google+ Buttons in CSS design from Pixify
 *   (http://pixify.com/blog/use-google-plus-to-improve-your-ui/).
 *
 * @author Chun Lin (GCL Project)
 *
 *
 * @name oneSimpleTablePagination
 * @type jQuery
 * @param Object userConfigurations:
 *      rowsPerPage - Number - used to determine the starting rows per page. Default: 10
 *      topNav - Boolean - This specifies the desire to have the navigation be a top nav bar
 *
 *
 * @requires jQuery v1.2.3 or above
 */


$.prototype.extend(
	{
		'oneSimpleTablePagination': function(userConfigurations) {
			var defaults = {
				rowsPerPage : 10,
				topNav : false
			};
			defaults = $.extend(defaults, userConfigurations);
			
			return this.each(function() {
				var table = $(this)[0];
				
				var currPageId = '#tablePagination_currPage';
				
				var tblLocation = (defaults.topNav) ? "prev" : "next";
		
				var tableRows = $.makeArray($('tbody tr', table));
		  
				var totalPages = countNumberOfPages(tableRows.length);
				
				var currPageNumber = 1;		  
		  
				function hideOtherPages(pageNum) {
					var intRegex = /^\d+$/;
					if (!intRegex.test(pageNum) || pageNum < 1 || pageNum > totalPages)
						return;
					var startIndex = (pageNum - 1) * defaults.rowsPerPage;
					var endIndex = (startIndex + defaults.rowsPerPage - 1);
					$(tableRows).show();
					for (var i = 0; i < tableRows.length; i++) {
						if (i < startIndex || i > endIndex) {
							$(tableRows[i]).hide();
						}
					}
				}
		  
				function countNumberOfPages(numRows) {
					var preTotalPages = Math.round(numRows / defaults.rowsPerPage);
					var totalPages = (preTotalPages * defaults.rowsPerPage < numRows) ? preTotalPages + 1 : preTotalPages;
					return totalPages;
				}
		  
				function resetCurrentPage(currPageNum) {
					var intRegex = /^\d+$/;
					if (!intRegex.test(currPageNum) || currPageNum < 1 || currPageNum > totalPages)
						return;
					currPageNumber = currPageNum;
					hideOtherPages(currPageNumber);
					$(table)[tblLocation]().find(currPageId).val(currPageNumber);
				}
		  
				function createPaginationElements() {
					var paginationHTML = "";
					paginationHTML += "<div id='tablePagination' style='text-align: center; padding-top: 5px; padding-bottom: 5px;'>";
					paginationHTML += "<a id='tablePagination_firstPage' href='javascript:;' class='button left'>|&lt;</a>";
					paginationHTML += "<a id='tablePagination_prevPage' href='javascript:;' class='button right'>&lt;&lt;</a>";
					/*paginationHTML += "Page";*/
					paginationHTML += "<input id='tablePagination_currPage' type='input' value='" + currPageNumber + "' size='1'>";
					paginationHTML += "of " + totalPages + "&nbsp;&nbsp;&nbsp;";
					paginationHTML += "<a id='tablePagination_nextPage' href='javascript:;' class='button left'>&gt;&gt;</a>";
					paginationHTML += "<a id='tablePagination_lastPage' href='javascript:;' class='button right'>&gt;|</a>";
					paginationHTML += "</div>";
					return paginationHTML;
				}
		  
				$(this).before(
						"<style type='text/css'>" +
						"	a.button {" +
						"		color: #023042;" +
						"		font: bold 12px Helvetica, Arial, sans-serif;" +
						"		text-decoration: none;" +
						"		padding: 7px 12px;" +
						"		position: relative;" +
						"		display: inline-block;" +
						"		text-shadow: 0 1px 0 #fff;	" +
						"		-webkit-transition: border-color .218s;" +
						"		-moz-transition: border .218s;" +
						"		-o-transition: border-color .218s;" +
						"		transition: border-color .218s;" +
						"		border: solid 1px #023042;" +
						"		border-radius: 2px;" +
						"		-webkit-border-radius: 2px;" +
						"		-moz-border-radius: 2px;" +
						"		margin-right: 10px;" +
						"	}" +
						"	a.button:hover {" +
						"		background-color: rgba(220, 220, 220, 0.85);" +
						"		border-color: #247FCA;" +
						"		-moz-box-shadow: 0 2px 0 rgba(0, 0, 0, 0.2);" +
						"		-webkit-box-shadow:0 2px 5px rgba(0, 0, 0, 0.2);" +
						"		box-shadow: 0 1px 2px rgba(0, 0, 0, 0.15);" +
						"	}" +
						"	a.button:active {" +
						"		color: #000;" +
						"		border-color: #444;" +
						"	}" +
						"	a.left {" +
						"		color: black;" +
						"		border-color: black;" +
						"		background-color: rgba(192, 192, 192, 0.85);" +
						"		border-style:groove;" +
						"		border-color:black;" +
						"		border-width:3px;" +
						"		-webkit-box-shadow: 0 0 10px rgb(0,0,0);" +
						"		-moz-box-shadow: 0 0 10px rgb(0,0,0);" +
						"	}" +
						"	a.right {" +
						"		color: black;" +
						"		border-color: black;" +
						"		background-color: rgba(192, 192, 192, 0.85);" +
						"		border-style:groove;" +
						"		border-color:black;" +
						"		border-width:3px;" +
						"		-webkit-box-shadow: 0 0 10px rgb(0,0,0);" +
						"		-moz-box-shadow: 0 0 10px rgb(0,0,0);" +
						"	}" +
						"</style>");
				
				if (defaults.topNav) {
					$(this).before(createPaginationElements());
				} else {
					$(this).after(createPaginationElements());
				}
		  
				hideOtherPages(currPageNumber);
				
				$(table)[tblLocation]().find('#tablePagination_firstPage').click(function (e) {
					resetCurrentPage(1);
			  	});
			  
			  	$(table)[tblLocation]().find('#tablePagination_prevPage').click(function (e) {
					resetCurrentPage(parseInt(currPageNumber) - 1);
			  	});
			  
			  	$(table)[tblLocation]().find('#tablePagination_nextPage').click(function (e) {
					resetCurrentPage(parseInt(currPageNumber) + 1);
			  	});
			  
			  	$(table)[tblLocation]().find('#tablePagination_lastPage').click(function (e) {
					resetCurrentPage(totalPages);
			  	});
		  
				$(table)[tblLocation]().find(currPageId).on('change', function (e) {
					resetCurrentPage(this.value);
				});
		  
			})
		}
	})