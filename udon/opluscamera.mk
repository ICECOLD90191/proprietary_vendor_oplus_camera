LOCAL_PATH := vendor/oplus/camera/udon

PRODUCT_PACKAGES += \
    android.hardware.graphics.common-V3-ndk.vendor \
    init.oplus.camera.rc \
    init.oplus.camera.system_ext.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/oplus_google_lens_config.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/oplus_google_lens_config.xml \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-oplus.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-oplus.xml \
    $(LOCAL_PATH)/configs/sysconfig/hiddenapi-package-oplus-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/hiddenapi-package-oplus-whitelist.xml

PRODUCT_PRODUCT_PROPERTIES += \
    persist.vendor.camera.privapp.list=com.oplus.camera \
    ro.com.google.lens.oem_camera_package=com.oplus.camera \
    ro.com.google.lens.oem_image_package=com.oneplus.gallery \
    ro.oplus.system.camera.flashlight=com.oplus.motor.flashlight \
    ro.oplus.system.camera.name=com.oplus.camera \
    ro.camera.disableHeicUltraHDR=1 \
    oplus.software.camera.10bit=1 \
    ro.oplus.camera.facing.front.need.disable.nfc=1 \
    ro.oplus.camera.speechassist=true \
    ro.build.version.oplus.api=37 \
    ro.build.version.oplus.sub_api=34 \
    persist.logd.log.load.com.oplus.camera.lower_limit=1000 \
    persist.logd.log.load.com.oplus.camera.threshold=800000 \
    persist.logd.log.load.com.oplus.camera.upper_limit=3000 \
    persist.logd.log.load.vendor.qti.camera.provider-service_64.lower_limit=500 \
    persist.logd.log.load.vendor.qti.camera.provider-service_64.threshold=400000 \
    persist.logd.log.load.vendor.qti.camera.provider-service_64.upper_limit=1500

$(call soong_config_set,camera,target_ships_oplus_cam,true)
$(call soong_config_set,camera,allow_nonincreasing_timestamps,true)

$(call soong_config_set,camera,package_name,com.oplus.packageName)
$(call soong_config_set_bool,libui,vendor_legacy_graphic_buffer_layout,true)

$(call inherit-product, vendor/oplus/camera/udon/blobs/blobs-vendor.mk)

include vendor/oplus/camera/sepolicy/SEPolicy.mk
