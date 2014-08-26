package com.core.module.hud.view
{
	import starling.display.Sprite;
	import starling.text.TextField;

	public class BossHpBar extends Sprite
	{
		private var _label:TextField;

		public function BossHpBar()
		{
			super();
			this.touchable=false;

			_label=new TextField(200, 30, "", "simsun", 24, 0xff0000, true);
			_label.text="克拉肯HP:1000";
			addChild(_label);
		}

		public function update(value:Number):void
		{
			if (_label)
				_label.text="克拉肯HP:" + value;
		}
	}
}
