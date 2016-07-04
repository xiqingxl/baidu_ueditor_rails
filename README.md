# Baidu ueditor for rails


[baidu ueditor][1] for rails, precompile codes from [tinymce-rails][2]

  [1]: http://ueditor.baidu.com/website/
  [2]: https://github.com/spohlenz/tinymce-rails

## Version
ueditor 1.4.3.3

## Installation

Add this line to your application's Gemfile:

    gem 'baidu_ueditor_rails'

And then execute:

    $ bundle


## Generating custom config js

Usage:


    rails g baidu_ueditor_rails:install


Then add codes in application.js


```ruby
//= require baidu_ueditor
//= require ueditor_custom_config
```

## Custom config

In ueditor_custom_config.js, it looks like:

```ruby
//ueditor custom config
(function () {
    window.CUSTOM_CONFIG = {
      // Insert your config code
	  	imageUrl: "/ueditor_images"
		,imagePath: ""
		,maxImageSideLength: 600
		,elementPathEnabled: false
		,wordCount:0          //是否开启字数统计
		,maximumWords:5000       //允许的最大字符数
		,savePath: ['upload']
      // toolbars: [
      //      ['Source','Undo','Redo','Cleardoc','SearchReplace','InsertImage','WordImage','Bold','ForeColor','JustifyLeft',
      //      'JustifyCenter','JustifyRight','JustifyJustify','RemoveFormat','FormatMatch','AutoTypeSet','PastePlain',
      //      'FontSize','Preview','Link','FullScreen', 'PageBreak', 'InsertTable','Attachment','InsertVideo']
      // ]
    };
    jQuery.extend(window.UEDITOR_CONFIG, window.CUSTOM_CONFIG);
})();
```

you can write your custom config in

```ruby
window.CUSTOM_CONFIG = {
  //.........
};
```

## Upload File

```ruby
	class UeditorImagesController < ApplicationController
	  skip_before_filter :verify_authenticity_token, :only => [:create]
	  def create
	    @ueditor_image = UeditorImage.new(image: params[:upfile])
	    respond_to do |format|
	      if @ueditor_image.save
	        data = {:url=> @ueditor_image.image.url, :title => params[:title], :original => params[:upfile].original_filename, :state => 'SUCCESS'}
	      else
	        data = {:title => params[:title], :original => params[:upfile].original_filename, :state => 'FAIL'}
	      end
	      format.js {render :json => data.to_json}
	    end
	  end
	end
```

## Views

```javascript
<script type="text/javascript">
  var editor = new UE.ui.Editor();
  editor.render("your_textarea_id");
</script>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
