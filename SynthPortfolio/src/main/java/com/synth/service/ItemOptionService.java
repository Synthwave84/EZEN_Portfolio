package com.synth.service;

import java.util.List;

import com.synth.domain.OptionTypeVO;
import com.synth.dto.ItemOptionDTOList;


public interface ItemOptionService {

	List<ItemOptionDTOList> getOptionList();
	List<OptionTypeVO> getOptionType();
	List<ItemOptionDTOList> getOptionCg(Integer option_type_id);
	List<ItemOptionDTOList> getOptionValue(Integer option_cg_id);
}
