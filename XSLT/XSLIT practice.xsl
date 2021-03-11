<?xml version="1.0"?> <!-- header and file declaration -->
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">
	
	<xsl:output method="xml" indent="yes" encoding="UTF-8"/>
	
	<xsl:template match="/dailyTransaction"> <!-- matches with root element -->
	
	<html>
	
		<head>
			<title><xsl:value-of select="@date" /></title>
		</head>
		
		<body>
			<div align="center" style="background-color:lightgrey">
			<h1>XSLIT example</h1>
			
			<table border="1">
				<tr>
					<td>Name</td>
					<td>Student Number</td>
					<td>Mobile</td>
					<td>Operation</td>
					<td>Mark</td>
				</tr>
				
				<xsl:for-each select="person"> <!-- for loop, note that you can also filter based on a condition -->
				<xsl:sort select="lastName" />
					<tr>
						<td>
							<xsl:value-of select="firstName" /> <!-- selecting elements -->
							<xsl:text> </xsl:text>
							<xsl:value-of select="lastName" />
						</td>
						
						<td>
							<xsl:value-of select="@studentId" /> <!-- selecting attributes -->
						</td>
						
						<td>
							<xsl:value-of select="mobile" />
						</td>
						
						<td>
							<xsl:choose>
								<xsl:when test="@operation = 'add' "> <!-- casewhere statement, you can also use if, however there is no else statement -->
									<img src="https://img.icons8.com/ios/452/add.png" width="30px" />
								</xsl:when>
								<xsl:when test="@operation = 'update' ">
									<img src="https://cdn.iconscout.com/icon/free/png-512/update-autorenew-refresh-reload-31805.png" width="30px" />
								</xsl:when>
								<xsl:when test="@operation = 'delete' ">
									<img src="https://cdn.iconscout.com/icon/premium/png-256-thumb/delete-1432400-1211078.png" width="30px" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@operation" />
								</xsl:otherwise>
							</xsl:choose>
						</td>
						
						<td>
							<xsl:choose> <!-- Casewhere statement -->
								<xsl:when test="mark &gt; 80">
									<span style="color:green">
										<xsl:value-of select="mark" />
									</span>
								</xsl:when>
								
								<xsl:when test="(mark &lt;= 80) and (mark &gt;= 50) ">
									<span style="color:yellow">
										<xsl:value-of select="mark" />
									</span>
								</xsl:when>
								
								<xsl:when test="mark &lt; 50">
									<span style="color:red">
										<xsl:value-of select="mark" />
									</span>
								</xsl:when>
								
								<xsl:otherwise>
									<xsl:value-of select="mark" />
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
					
				</xsl:for-each>
				
			</table>
			
			</div>
		</body>
	</html>
	</xsl:template>
</xsl:stylesheet>
			