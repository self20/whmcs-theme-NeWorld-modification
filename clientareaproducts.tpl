{include file="$template/includes/tablelist.tpl" tableName="ServicesList" filterColumn="3"}
<script type="text/javascript">
    jQuery(document).ready( function ()
    {
        var table = jQuery('#tableServicesList').removeClass('hidden').DataTable();
        {if $orderby == 'product'}
            table.order([0, '{$sort}'], [3, 'asc']);
        {elseif $orderby == 'amount' || $orderby == 'billingcycle'}
            table.order(1, '{$sort}');
        {elseif $orderby == 'nextduedate'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'domainstatus'}
            table.order(3, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').addClass('hidden');
    });
</script>
<h3 class="headline">{$pagetitle}</h3>
<div class="table-container clearfix">
    <table id="tableServicesList" class="table table-list hidden">
        <thead>
            <tr>
                <th>{$LANG.orderproduct}</th>
                <th class="hidden-xs">{$LANG.clientareaaddonpricing}</th>
                <th class="hidden-xs">{$LANG.clientareahostingnextduedate}</th>
                <th>{$LANG.clientareastatus}</th>
                <th class="responsive-edit-button" style="display: none;"></th>
            </tr>
        </thead>
        <tbody>
            {foreach key=num item=service from=$services}
                <tr onclick="clickableSafeRedirect(event, 'clientarea.php?action=productdetails&amp;id={$service.id}', false)">
                    <td>
	                    <strong>{$service.product}</strong>
                    	{if $service.domain}
                    	<p class="hidden-xs hidden-sm"><a href="http://{$service.domain}" target="_blank">{$service.domain}</a></p>
                    	{/if}
	                </td>
                    <td class="hidden-xs">{$service.amount} {$service.billingcycle}</td>
                    <td class="hidden-xs"><span class="hidden">{$service.normalisedNextDueDate}</span>{$service.nextduedate}</td>
                    <td><span class="label status status-{$service.status|strtolower}">{$service.statustext}</span></td>
                    <td class="responsive-edit-button" style="display: none;">
                        <a href="clientarea.php?action=productdetails&amp;id={$service.id}" class="btn btn-block btn-info">
                            {$LANG.manageproduct}
                        </a>
                    </td>
                </tr>
            {/foreach}
        </tbody>
    </table>
    <div class="text-center" id="tableLoading">
        <p><i class="fa fa-spinner fa-spin"></i> {$LANG.loading}</p>
    </div>
</div>
