package com.core.module.main.view
{
	import com.core.MainApplaction;
	import com.core.globals.GiftType;
	import com.core.utils.FilterManager;

	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;

	public class GiftCell extends Sprite
	{
		private var _type:uint=GiftType.NONE;
		private var texture:Texture;
		private var icon:Image;
		private var _selected:Boolean;

		public function GiftCell(type:uint)
		{
			super();
			_type=type;
			if (type != GiftType.NONE)
			{
				texture=MainApplaction.sAssets.getTextureAtlas("icons").getTexture(GiftType.getGiftTexture(type));
				icon=new Image(texture);
				this.addChild(icon);
			}
		}

		public function get type():uint
		{
			return _type;
		}

		public function get selected():Boolean
		{
			return _selected;
			this.filter=null;
		}

		public function set selected(value:Boolean):void
		{
			_selected=value;
			this.filter=FilterManager.greenGlowFilter;
		}

		public function setGiftType(type:uint):void
		{
			if (icon != null)
			{

			}
		}

	}
}
