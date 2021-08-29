
<%						
						int sid=0;
						String temp[]=null;
						
						String tname=null,sign=null;
						
						String myname = (String)session.getAttribute("myname");
						
						StringBuffer mysecret=new StringBuffer();
						
						ResultSet rs = null;
						try {			
						Connection con=databasecon.getconnection(); 

						Statement st=con.createStatement();

								String qry ="select * from privacy where name='"+myname+"' and status = 'Signature' "; 
								rs = st.executeQuery(qry);
								rs.next();
								myshare=rs.getInt("piece");
								sid=rs.getInt("id");
								sid--;
								//my secret
									for(int i=0;i<myshare;i++,sid--)
           							{
										if(i==0){
											String sql="select * from privacy where id = '"+sid+"'";
											rs = st.executeQuery(sql);
											rs.next();
											mysecret.append(rs.getString("disease"));
											
										}
										if(i==1){
											String sql="select * from privacy where id = '"+sid+"'";
											rs = st.executeQuery(sql);
											rs.next();
											mysecret.append("--");
											mysecret.append(rs.getString("stage"));
											
										}
										if(i==2){
											String sql="select * from privacy where id = '"+sid+"'";
											rs = st.executeQuery(sql);
											rs.next();
											mysecret.append("--");
											mysecret.append(rs.getString("drug"));
											
										}
										if(i==3){
											String sql="select * from privacy where id = '"+sid+"'";
											rs = st.executeQuery(sql);
											rs.next();
											mysecret.append("--");
											mysecret.append(rs.getString("location"));
											
										}
										        
             
            						}
								//my	
						
						
						
					} 
					catch (Exception e) 
					{
						out.println(e.getMessage());
					}
%>
<%
String mytemp[]=null;

mytemp=(mysecret.toString()).split("--");

%>

