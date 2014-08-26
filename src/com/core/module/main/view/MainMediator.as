package com.core.module.main.view
{
	import com.core.BaseViewMediator;
	import com.core.MainApplaction;
	import com.core.ModuleGlobals;
	import com.core.globals.Globals;

	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;

	public class MainMediator extends BaseViewMediator implements IMediator
	{
		public function MainMediator(viewComponent:Object=null)
		{
			super(ModuleGlobals.MAIN_MEDIATOR, viewComponent);
		}

		override public function listNotificationInterests():Array
		{
			return [Globals.GAME_RESOURCE_LOADED];
		}

		override public function handleNotification(note:INotification):void
		{
			switch (note.getName())
			{

				case Globals.GAME_RESOURCE_LOADED:
					MainApplaction.getInstance()._mainLayer.addChild(this);
					GiftSelectView.show();
//					var tile:CellTile=new CellTile(8, 4);
//					this.addChild(tile);
					break;
			}
		}
	}
}
