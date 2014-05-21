require 'formula'

class ExactImage < Formula
  homepage 'http://www.exactcode.com/site/open_source/exactimage/'
  head 'https://svn.exactcode.de/exact-image/trunk'

  depends_on 'libagg' => :build
  depends_on 'pkg-config' => :build
  depends_on 'freetype' => :optional
 
  # finxing a double inclusion with a #pragma once
  patch :DATA

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install" 
  end

end
__END__
diff --git a/lib/scale.hh b/lib/scale.hh
index 0b9f75a..7b69968 100644
--- a/lib/scale.hh
+++ b/lib/scale.hh
@@ -15,6 +15,7 @@
  * Alternatively, commercial licensing options are available from the
  * copyright holder ExactCODE GmbH Germany.
  */
+#pragma once
 
 // pick the best
 void scale (Image& image, double xscale, double yscale);

