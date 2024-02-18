package com.synth.mapper;

import java.util.List;

import com.synth.domain.OptionCgVO;
import com.synth.domain.OptionTypeVO;
import com.synth.domain.OptionValueVO;
import com.synth.dto.ItemOptionDTOList;

public interface ItemOptionMapper {

	List<ItemOptionDTOList> getOptionList();
	List<OptionTypeVO> getOptionType();
	List<ItemOptionDTOList> getOptionCg(Integer option_type_id);
	List<ItemOptionDTOList> getOptionValue(Integer option_cg_id);
}
