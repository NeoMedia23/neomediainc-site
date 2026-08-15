PHOTOS — how to add your portfolio images
==========================================

The homepage portfolio ("Selected frames") has three slots. To fill them:

1. Put your photos in THIS folder, named:
      01.jpg   02.jpg   03.jpg
   (JPG or PNG both fine. Landscape shots look best — they're shown at 3:2.)

2. Tell Claude "wire in the photos" and it will swap each empty frame for your
   image and add a caption. Or do it by hand in ../index.html: find the line

      <figure class="shot"><div class="img ph">Frame 01</div>...

   and replace the inner part with

      <figure class="shot"><div class="img"><img src="photos/01.jpg" alt="Short description"></div><figcaption class="cap">Your caption</figcaption></figure>

Only use photos you took (or have the rights to show). The site says
"owned work, no stock" — keep that true. Three real photos beat six empty frames.
You can add more than three frames by copying a <figure> block.
