package com.core.module.main.view
{
	import com.core.MainApplaction;
	import com.core.utils.FilterManager;
	import com.core.vo.SkillVO;

	import flash.geom.Point;

	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;

	public class SkillCell extends Sprite
	{
		public var skillVO:SkillVO;
		public var position:Point;
		public var texture:Texture;
		public static const SIZE:Number=80;
		private var _selected:Boolean=false;

		public function SkillCell(pos:Point, vo:SkillVO)
		{
			super();
			position=pos;
			skillVO=vo;
			texture=MainApplaction.sAssets.getTextureAtlas("icons").getTexture(vo.textureName);
			var image:Image=new Image(texture);
			image.scaleX=image.scaleY=SIZE / texture.width;
//			image.touchable=false;
			this.addChild(image);
		}

		public function get selected():Boolean
		{
			return _selected;
		}

		public function set selected(value:Boolean):void
		{
			_selected=value;
			if (_selected)
			{
				this.filter=FilterManager.greenGlowFilter;
			}
			else
			{
				this.filter=null;
			}
		}

	}
}
