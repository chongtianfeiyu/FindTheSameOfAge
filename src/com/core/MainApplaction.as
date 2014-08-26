package com.core
{
	import com.core.module.hud.controller.HudCommand;
	import com.core.module.hud.model.HudProxy;
	import com.core.module.hud.view.HudView;
	import com.core.module.main.controller.MainCommand;
	import com.core.module.main.model.MainProxy;
	import com.core.module.main.view.MainMediator;

	import flash.desktop.NativeApplication;
	import flash.ui.Keyboard;

	import feathers.themes.MinimalMobileTheme;

	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;

	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;
	import starling.utils.AssetManager;


	public class MainApplaction extends starling.display.Sprite
	{
		public static var sAssets:AssetManager;
		public static var mStarling:Starling;

		public var _uiLayer:Sprite;
		public var _effectLayer:Sprite;
		public var _mainLayer:Sprite;
		private var _loading:LoadingCanvas;

		public function MainApplaction()
		{
			super();
		}

		public function start(starling:Starling, assets:AssetManager):void
		{
			mStarling=starling;
			sAssets=assets;
			new MinimalMobileTheme();

			_mainLayer=new Sprite();
			this.addChild(_mainLayer);

			_uiLayer=new Sprite();
			this.addChild(_uiLayer);

			_effectLayer=new Sprite();
			this.addChild(_effectLayer);

			_loading=new LoadingCanvas();
			this.addChild(_loading);

			sAssets.loadQueue(function(ratio:Number):void
			{
				_loading.update(ratio);
			});

			initPureMVC();

			this.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}

		private function onKeyDown(e:KeyboardEvent):void
		{
			this.stage.removeEventListeners(KeyboardEvent.KEY_DOWN);
			if (e.keyCode == Keyboard.BACK)
			{
				e.stopPropagation();
				NativeApplication.nativeApplication.exit();
			}
		}

		private function initPureMVC():void
		{
			facade.registerCommand(ModuleGlobals.MAIN_CMD, MainCommand);
			facade.registerMediator(new MainMediator());
			facade.registerProxy(new MainProxy());

			facade.registerCommand(ModuleGlobals.HUD_CMD, HudCommand);
			facade.registerMediator(new HudView());
			facade.registerProxy(new HudProxy());
		}

		/**
		 *只允许starling创建实例
		 * @return
		 *
		 */
		public static function getInstance():MainApplaction
		{
			return mStarling.root as MainApplaction;
		}

		public static function get facade():IFacade
		{
			return Facade.getInstance();
		}
	}
}
