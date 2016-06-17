			$(function(){
					var operacao = "A"; //"A"=Adição; "E"=Edição
					var indice_selecionado = -1; //Índice do item selecionado na lista
					var tbClientes = localStorage.getItem("tbClientes");// Recupera os dados armazenados
					tbClientes = JSON.parse(tbClientes); // Converte string para objeto
					if(tbClientes == null) // Caso não haja conteúdo, iniciamos um vetor vazio
					tbClientes = [];
				});

					function Adicionar(){
						var cliente = JSON.stringify({
							Imagem   : $("#txtCodigo").val(),
							Nome     : $("#txtNome").val(),
							Telefone : $("#txtTelefone").val(),
							Email    : $("#txtEmail").val()
						});
						tbClientes.push(cliente);
						localStorage.setItem("tbClientes", JSON.stringify(tbClientes));
						alert("Registro adicionado.");
						return true;
					}
					
					$('.btnListar').click(function(){
						
						var tamanho = localStorage.length;
						var chave = '';
						var valor = '';
						
							if(document.getElementById("tableResults").rows.length > 1)	{
							for(var t = document.getElementById("tableResults").rows.length; t > 1; t--){
								document.getElementById("tableResults").deleteRow(1);
								}
							}
							
				            var numOfCols = document.getElementById("tableResults").rows[document.getElementById("tableResults").rows.length-1].cells.length;
            		
							for(var c = 0; c < tamanho;c++){
								chave = localStorage.key(c);
								valor = localStorage.getItem(chave);
								
								var newRow = document.getElementById("tableResults").insertRow(document.getElementById("tableResults").rows.length);
								for (var j = 0; j < numOfCols; j++) {
									newCell = newRow.insertCell(j);
										if(j==0){
											newCell.innerHTML = chave.toUpperCase();
										}else if(j == 1){
											newCell.innerHTML = valor;
										}
								}
							}
						
					})	

					$('.btnApagar').click(function(){
						   
						   localStorage.clear()					
						   
					})
				}); 	
