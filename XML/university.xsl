<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="/">
<html>
<body>
  <h2><center><font size="8">Institutions</font></center></h2>

<xsl:for-each select="institution/university">

 <center><u><h2><xsl:value-of select="univname"/> (ID:<xsl:value-of select="@universityid"/>)</h2></u></center>
  <table border="2">
    <tr>
 <td>
  <table border="5">
   <tr bgcolor="#00CED1">
    <th colspan="5"><font size="5">FACULTY</font></th>
    </tr>
    <tr>
      <th rowspan="2">First Name</th>    
      <th rowspan="2">Last Name</th>
      <th colspan="3">Department</th>      
    </tr>

   <tr>
      <th>Department Name</th>      
      <th>Course</th>      
      <th>Designation</th> 
   </tr>
<xsl:for-each select="faculty">

<tr>     
    
       <td><xsl:value-of select="firstname"/></td>
     
        <td><xsl:value-of select="lastname"/></td>

        <td><xsl:value-of select="department/depname"/></td>
        <td><xsl:value-of select="department/course"/></td>
    
        <td><xsl:value-of select="department/designation"/></td>
       
   </tr>
</xsl:for-each>

    
  </table>
</td>

                        <!-- Second Table -->

<td valign="top"> <table border="5">
   <tr bgcolor="#00CED1">
    <th colspan="3"><font size="5">ADDRESS</font></th>
    </tr>

    <tr>
      <th>Country</th>    
      <th>City</th>
      <th>Zip code</th>      
    </tr>
<xsl:for-each select="address">

<tr>     
    
       <td rowspan="2"><xsl:value-of select="country"/></td>
     
        <td rowspan="2"><xsl:value-of select="city"/></td>

        <td rowspan="2"><xsl:value-of select="zipcode"/></td>
        
       
   </tr>
</xsl:for-each>


   
    

  </table> 
</td>


                  <!-- Third Table -->





<td valign="top"> <table border="5">
   <tr bgcolor="#00CED1">
    <th colspan="3"><font size="5">PUBLICATIONS</font></th>
    </tr>

<tr>
      <th>Name</th>    
      <th>ISDN</th>   
      <th>Year</th>   
    </tr>
<xsl:for-each select="publications">

<tr>     
    
       <td><xsl:value-of select="label"/></td>
     
        <td><xsl:value-of select="isdn"/></td>
        <td><xsl:value-of select="year"/></td>

   </tr>
</xsl:for-each>


   
    

  </table> 
</td>




</tr>
</table>

</xsl:for-each>
<xsl:apply-templates/>


</body>
</html>
</xsl:template>

<xsl:template match="institution">
      <h2>Papers published before year 2000</h2>
     <xsl:apply-templates select="university"/> 
<h2>Courses offered in Software Engineering</h2>
<xsl:apply-templates select="university/faculty"/> 
</xsl:template>



<xsl:template match="university/faculty">
<xsl:for-each select="department">
      <xsl:if test="depname='Software Engineering'">
<table border="4">
 <tr>
        
          <td><xsl:value-of select="course"/></td>
        
</tr>
</table>
      </xsl:if>
      </xsl:for-each>
</xsl:template>





<xsl:template match="university">

<xsl:for-each select="publications">
      <xsl:if test="year &lt; 2000">
<table border="4">
 <tr>
        
          <td><xsl:value-of select="label"/></td>
        
</tr>
</table>
      </xsl:if>
      </xsl:for-each>

</xsl:template>

</xsl:stylesheet>













