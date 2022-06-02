<?php use App\Controllers\Inventarios; ?>
<?php if(isset($_SESSION['Rol'])): ?>
        <?php if($_SESSION['Rol']=="Administrador"):?>
            <?=$header?>
                <br/>
                <br/>
                <br/>
                
                <div class="container mt-5 justify-content-center ml-3">
                    <table id="dtDynamicVerticalScrollExample" class="table-light table table-striped table-bordered table-sm" cellspacing="0">
                        <thead class="thead-light">
                            <tr>
                                <th hidden="true">id_inventario</th> 
                                <th>Nombre del producto</th>
                                <th>Precio del producto</th>
                                <th>Tipo de producto</th>
                                <th>Cantidad actual del producto</th>
                                <th>Medida</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach($inventarios as $inventario):?>
                                <?php if(Inventarios::IsPrioridad3($inventario['id_inventario'])):?>
                                    <tr id="datosTabla" class="table-success">
                                        <td  hidden="true"><?=$inventario['id_inventario']?></td>
                                        <td><?=$inventario['Nombre']?></td>
                                        <td><?=$inventario['Precio']?></td>
                                        <td><?=$inventario['Tipo']?></td>
                                        <td><?=$inventario['CantidadActual']?></td>
                                        <td><?=$inventario['Medida']?></td>
                                        <td>
                                            <a id="DeletePaciente" href="<?=base_url('/borrarProducto/'.$inventario['id_inventario']);?>" class="btn btn-danger" type="button">Borrar</a>
                                        </td>
                                    </tr>
                                <?php elseif(Inventarios::IsPrioridad2($inventario['id_inventario'])):?>
                                    <tr id="datosTabla" class="table-warning">
                                        <td  hidden="true"><?=$inventario['id_inventario']?></td>
                                        <td><?=$inventario['Nombre']?></td>
                                        <td><?=$inventario['Precio']?></td>
                                        <td><?=$inventario['Tipo']?></td>
                                        <td><?=$inventario['CantidadActual']?></td>
                                        <td><?=$inventario['Medida']?></td>
                                        <td>
                                            <a id="DeletePaciente" href="<?=base_url('/borrarProducto/'.$inventario['id_inventario']);?>" class="btn btn-danger" type="button">Borrar</a>
                                        </td>
                                    </tr>
                                <?php else:?>
                                    <tr id="datosTabla" class="table-danger">
                                        <td  hidden="true"><?=$inventario['id_inventario']?></td>
                                        <td><?=$inventario['Nombre']?></td>
                                        <td><?=$inventario['Precio']?></td>
                                        <td><?=$inventario['Tipo']?></td>
                                        <td><?=$inventario['CantidadActual']?></td>
                                        <td><?=$inventario['Medida']?></td>
                                        <td>
                                            <a id="DeletePaciente" href="<?=base_url('/borrarProducto/'.$inventario['id_inventario']);?>" class="btn btn-danger" type="button">Borrar</a>
                                        </td>
                                    </tr>
                                <?php endif?>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
                <?php elseif($_SESSION['Rol']== "Doctor"):?>
                    <?=$header?>
                <br/>
                <br/>
                <br/>
                
                <div class="container mt-5 justify-content-center ml-3">
                    <table id="dtDynamicVerticalScrollExample" class="table table-striped table-bordered table-sm" cellspacing="0">
                    <thead class="thead-light">
                            <tr>
                                <th hidden="true">id_inventario</th> 
                                <th>Nombre del producto</th>
                                <th>Precio del producto</th>
                                <th>Tipo de producto</th>
                                <th>Cantidad actual del producto</th>
                                <th>Medida</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php   foreach($inventarios as $inventario):?>
                                <?php if(Inventarios::IsPrioridad3($inventario['id_inventario'])):?>
                                    <tr id="datosTabla" class="table-success">
                                        <td  hidden="true"><?=$inventario['id_inventario']?></td>
                                        <td><?=$inventario['Nombre']?></td>
                                        <td><?=$inventario['Precio']?></td>
                                        <td><?=$inventario['Tipo']?></td>
                                        <td><?=$inventario['CantidadActual']?></td>
                                        <td><?=$inventario['Medida']?></td>
                                    </tr>
                                <?php elseif(Inventarios::IsPrioridad2($inventario['id_inventario'])):?>
                                    <tr id="datosTabla" class="table-warning">
                                        <td  hidden="true"><?=$inventario['id_inventario']?></td>
                                        <td><?=$inventario['Nombre']?></td>
                                        <td><?=$inventario['Precio']?></td>
                                        <td><?=$inventario['Tipo']?></td>
                                        <td><?=$inventario['CantidadActual']?></td>
                                        <td><?=$inventario['Medida']?></td>
                                    </tr>
                                <?php else:?>
                                    <tr id="datosTabla" class="table-danger">
                                        <td  hidden="true"><?=$inventario['id_inventario']?></td>
                                        <td><?=$inventario['Nombre']?></td>
                                        <td><?=$inventario['Precio']?></td>
                                        <td><?=$inventario['Tipo']?></td>
                                        <td><?=$inventario['CantidadActual']?></td>
                                        <td><?=$inventario['Medida']?></td>
                                    </tr>
                                <?php endif?>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            <?php endif ?>
        <?php endif ?>
</body>
</html>
</body>
</html>