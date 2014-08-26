package com.core.module.hud.view
{
	import com.core.BaseViewMediator;
	import com.core.MainApplaction;
	import com.core.ModuleGlobals;
	import com.core.globals.Globals;

	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;

	public class HudView extends BaseViewMediator implements IMediator
	{
		private var _bossHpBar:BossHpBar;
		private var _selfHpBar:SelfHpBar;

		public function HudView(viewComponent:Object=null)
		{
			super(ModuleGlobals.HUD_VIEW, viewComponent);
			_bossHpBar=new BossHpBar();
			addChild(_bossHpBar);
			_selfHpBar=new SelfHpBar();
			_selfHpBar.y=_bossHpBar.height;
			addChild(_selfHpBar);
		}

		override public function handleNotification(notification:INotification):void
		{
			switch (notification.getName())
			{
				case Globals.GAME_RESOURCE_LOADED:
					MainApplaction.getInstance()._uiLayer.addChild(this);
					break;
			}
		}

		override public function listNotificationInterests():Array
		{
			return [Globals.GAME_RESOURCE_LOADED];
		}


	}
}
