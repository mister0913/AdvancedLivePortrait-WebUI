import os
import pytest

from test_config import *
from modules.live_portrait.live_portrait_inferencer import LivePortraitInferencer
from modules.utils.image_helper import save_image


@pytest.mark.parametrize(
    "input_image,aaa",
    [
        (TEST_IMAGE_PATH, TEST_EXPRESSION_AAA),
    ]
)
def test_expression_editing(
    input_image: str,
    aaa: int
):
    if not os.path.exists(TEST_IMAGE_PATH):
        download_image(
            TEST_IMAGE_URL,
            TEST_IMAGE_PATH
        )

    inferencer = LivePortraitInferencer()

    edited_expression = inferencer.edit_expression(
        src_image=input_image,
        aaa=aaa
    )
    save_image(numpy_array=edited_expression, output_path=TEST_EXPRESSION_OUTPUT_PATH)

    assert os.path.exists(TEST_EXPRESSION_OUTPUT_PATH)
    assert are_images_different(input_image, TEST_EXPRESSION_OUTPUT_PATH)
